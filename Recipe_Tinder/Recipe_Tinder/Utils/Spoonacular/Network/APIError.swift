//
//  APIError.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation


enum APIError: Error, LocalizedError {
    case invalidURL
    case httpStatus(Int)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .httpStatus(let code): return "Server returned HTTP \(code)."
        }
    }
}
