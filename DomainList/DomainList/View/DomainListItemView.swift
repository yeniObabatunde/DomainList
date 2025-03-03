//
//  DomainListItemView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct DomainListItemView: View {
    let domain: Domain
    
    var body: some View {
        HStack {
            Text(domain.domain ?? "Unknown domain")
                .font(.title3)
                .fontWeight(.medium)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    DomainListItemView(domain: Domain.example)

}
