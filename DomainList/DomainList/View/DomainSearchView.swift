//
//  DomainSearchView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct DomainSearchView: View {
    @StateObject private var viewModel = DomainSearchViewModel()
    @State private var selectedDomain: Domain?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    SearchBarView(
                        text: $viewModel.searchText,
                        placeholder: Constants.Strings.searchForDomain
                    )
                    .padding(.bottom)
                    
                    switch viewModel.searchState {
                    case .empty:
                        EmptyStateView(message: Constants.Strings.searchForDomain)
                        
                    case .searching:
                        LoadingStateView()
                        
                    case .results(let domains):
                        Text("domain-one")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        SearchResultsView(domains: domains) { domain in
                            selectedDomain = domain
                        }
                        
                    case .notFound:
                        EmptyStateView(message: Constants.Strings.domainNotFound)
                        
                    case .error(let message):
                        ErrorStateView(message: message) {
                            let currentSearch = viewModel.searchText
                            viewModel.searchText = ""
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                viewModel.searchText = currentSearch
                            }
                        }
                    }
                }
                NavigationLink(
                    destination: selectedDomain.map { domain in
                        DomainPurchaseView(domain: domain, viewModel: viewModel)
                    },
                    tag: true,
                    selection: Binding(
                        get: { selectedDomain != nil },
                        set: { if !($0 ?? false) { selectedDomain = nil } }
                    )
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    DomainSearchView()
}

