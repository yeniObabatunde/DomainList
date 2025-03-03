//
//  EmptyStateView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct EmptyStateView: View {
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmptyStateView(message: "Search for a domain")
        .background(Color(.systemGray6))
}
