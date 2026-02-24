//
//  RecipeSearchDetailsView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipeID: Int
    @StateObject private var vm = RecipeDetailsViewModel()

    var body: some View {
        ScrollView {
            if vm.isLoading { ProgressView().padding() }

            if let r = vm.recipe {
                VStack(alignment: .leading, spacing: 12) {
                    Text(r.title).font(.title).bold()

                    if let img = r.image, let url = URL(string: img) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 220)
                                    .clipped()
                            default:
                                Rectangle().fill(.quaternary).frame(height: 220)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }

                    HStack {
                        if let mins = r.readyInMinutes { Text("⏱️ \(mins) min") }
                        if let servings = r.servings { Text("🍽️ Serves \(servings)") }
                    }
                    .foregroundStyle(.secondary)

                    Text("Details").font(.headline)
                    Text(cleanHTML(r.summary ?? "No details available."))

                    Text("Ingredients").font(.headline)
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(r.extendedIngredients ?? []) { ing in
                            Text("• \(ing.original ?? ing.name ?? "Ingredient")")
                        }
                    }

                    Text("How to Prepare").font(.headline)

                    let steps = instructionSteps(from: r.instructions ?? "")
                    if steps.isEmpty {
                        Text("No instructions available.")
                            .foregroundStyle(.secondary)
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(Array(steps.enumerated()), id: \.offset) { idx, step in
                                HStack(alignment: .top, spacing: 10) {
                                    Text("\(idx + 1).")
                                        .fontWeight(.bold)
                                    Text(step)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                }
                .padding()
            }

            if let msg = vm.errorMessage {
                Text(msg).foregroundStyle(.red).padding()
            }
        }
        .navigationTitle("Recipe")
        .navigationBarTitleDisplayMode(.inline)
        .task { await vm.load(id: recipeID) }
    }

    private func cleanHTML(_ html: String) -> String {
        guard let data = html.data(using: .utf8) else { return html }
        if let attributed = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) {
            return attributed.string.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return html
    }

    private func instructionSteps(from raw: String) -> [String] {
        let cleaned = cleanHTML(raw)
            .replacingOccurrences(of: "\r", with: "\n")
            .replacingOccurrences(of: "\n\n", with: "\n")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        if cleaned.isEmpty { return [] }

        // Try splitting by newlines first (often works)
        let byLines = cleaned
            .components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        if byLines.count >= 3 {
            return byLines
        }

        // Fallback: split by sentence-ish periods
        let bySentences = cleaned
            .components(separatedBy: ". ")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .map { $0.hasSuffix(".") ? String($0.dropLast()) : $0 }

        return bySentences.count >= 2 ? bySentences : [cleaned]
    }
}

#Preview {
    NavigationStack {
        RecipeDetailsView(recipeID: 12345)
    }
}
