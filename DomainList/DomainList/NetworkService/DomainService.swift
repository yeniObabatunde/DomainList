//
//  DomainService.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import Foundation
import Combine

protocol DomainServiceProtocol {
    func searchDomains(query: String) -> AnyPublisher<DomainResponse, NetworkError>
//    func purchaseDomain(domain: Domain) -> AnyPublisher<Bool, Error>
}

final class DomainListService: DomainServiceProtocol {
   
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func searchDomains(query: String) -> AnyPublisher<DomainResponse, NetworkError> {
        
        let queryItems = [URLQueryItem(name: "search", value: String(query))]
        
        return networkService.request(
            type: DomainResponse.self, endpoint: Constants.Endpooint.search,
            method: .get,
            queryItems: queryItems,
            body: nil,
            headers: nil
        )
    }
    
//    func purchaseDomain(domain: Domain) -> AnyPublisher<Bool, any Error> { }

}
