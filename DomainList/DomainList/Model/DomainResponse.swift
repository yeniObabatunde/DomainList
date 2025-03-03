//
//  DomainResponse.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import Foundation

struct DomainResponse: Codable {
    let domains: [Domain]?
    let total: Int?
    let time: String?
//    let nextPage: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case domains, total, time
//        case nextPage = "next_page"
    }
}

struct Domain: Codable, Identifiable {
    let domain, createDate, updateDate: String?
    let country: String?
    let isDead: IsDead?
    let a, ns: [String]?
    
    let mx: [MX]?
    let txt: [String]?
    
    var id: String {
        domain ?? UUID().uuidString
    }
    
    var price: Double {
        return 100.0
    }
    
    var isAvailable: Bool {
        isDead == .isDeadFalse
    }
    
    enum CodingKeys: String, CodingKey {
        case domain
        case createDate = "create_date"
        case updateDate = "update_date"
        case country, isDead
        case a = "A"
        case ns = "NS"
//        case cname = "CNAME"
        case mx = "MX"
        case txt = "TXT"
    }
    
    static var example: Domain {
        Domain(
            domain: "domain-one.com",
            createDate: "2023-01-01",
            updateDate: "2023-01-01",
            country: "US",
            isDead: .isDeadFalse,
            a: ["192.168.1.1"],
            ns: ["ns1.example.com"],
//            cname: nil,
            mx: [],
            txt: []
        )
    }
}

enum IsDead: String, Codable {
    case isDeadFalse = "False"
}

struct MX: Codable {
    let exchange: String?
    let priority: Int?
}

enum SearchState {
    case empty
    case searching
    case results([Domain])
    case notFound
    case error(String)
}
