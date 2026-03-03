//
//  HTTPClient.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation

final class HTTPClient {
    private let session: URLSession
    init(session: URLSession = .shared) { self.session = session }

    func get<T: Decodable>(_ url: URL, as type: T.Type) async throws -> T {
        let (data, response) = try await session.data(from: url)
        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw APIError.httpStatus(http.statusCode)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
