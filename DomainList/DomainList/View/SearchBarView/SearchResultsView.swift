//
//  SearchResultsView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct SearchResultsView: View {
    let domains: [Domain]
    let onSelection: (Domain) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(domains) { domain in
                    DomainListItemView(domain: domain)
                        .onTapGesture {
                            onSelection(domain)
                        }
                }
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    SearchResultsView(
        domains: [Domain.example, Domain.example],
        onSelection: { _ in }
    )
    .background(Color(.systemGray6))
}
