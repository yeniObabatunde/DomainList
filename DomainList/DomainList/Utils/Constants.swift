//
//  Constants.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import Foundation

struct Constants {
    struct Strings {
        static let searchForDomain = "Search for a domain"
        static let domainNotFound = "Domain not found"
        static let searching = "Searching..."
        static let errorTitle = "Error"
        static let retryButton = "Retry"
        static let ok = "OK"
    }
    
    struct Endpooint {
        static let search = "/domains/search/"
        
        static func search(query: String) -> String {
            "/domains/search?\(query)"
        }
    }
    
    struct Api {
        static let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String
    }
}
