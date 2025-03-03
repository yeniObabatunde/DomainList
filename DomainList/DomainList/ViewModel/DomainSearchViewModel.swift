//
//  DomainSearchViewModel.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import Combine
import SwiftUI

class DomainSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchState: SearchState = .empty
    
    private let domainListService: DomainServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(domainListService: DomainServiceProtocol = DomainListService(networkService: NetworkService(baseURL: Constants.Api.baseUrl ?? "", session: .shared))) {
        
        self.domainListService = domainListService
        setupSearchPublisher()
    }
    
    private func setupSearchPublisher() {
        $searchText
            .removeDuplicates()
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.handleSearchTextChange(text)
            }
            .store(in: &cancellables)
    }
    
    private func handleSearchTextChange(_ text: String) {
        guard !text.isEmpty, text.count >= 3 else {
            searchState = .empty
            return
        }
        
        searchState = .searching
        
        searchDomains(query: text)
    }
    
    private func searchDomains(query: String) {
           domainListService.searchDomains(query: query)
               .receive(on: DispatchQueue.main)
               .sink(
                   receiveCompletion: { [weak self] completion in
                       if case .failure(let error) = completion {
                           if error == .notFound {
                               self?.searchState = .notFound
                           } else {
                               self?.searchState = .error(error.localizedDescription)
                           }
                       }
                   },
                   receiveValue: { [weak self] response in
                       if let domains = response.domains, !domains.isEmpty {
                           self?.searchState = .results(domains)
                       } else {
                           self?.searchState = .notFound
                       }
                   }
               )
               .store(in: &cancellables)
       }
    
    func purchase(_ domain: Domain) -> Bool {
        return true
    }
}
