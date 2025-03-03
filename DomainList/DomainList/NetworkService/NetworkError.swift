//
//  NetworkError.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//
import Foundation

enum NetworkError: Error, Equatable {
    case invalidURL
    case noData
    case notFound
    case decodingError
    case serverError(Int)
    case unknown(Error)
    
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
             (.noData, .noData),
             (.notFound, .notFound),
             (.decodingError, .decodingError):
            return true
        case let (.serverError(code1), .serverError(code2)):
            return code1 == code2
        case (.unknown, .unknown):
            return false
        default:
            return false
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .notFound:
            return "Domain not found"
        case .decodingError:
            return "Failed to decode response"
        case .serverError(let code):
            return "Server error: \(code)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}
