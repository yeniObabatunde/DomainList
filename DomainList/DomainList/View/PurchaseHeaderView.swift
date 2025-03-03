//
//  PurchaseHeaderView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct PurchaseHeaderView: View {
    let domain: String
    let dismissAction: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: dismissAction) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                        )
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))

            Text(domain)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
        }
    }
}

#Preview {
    PurchaseHeaderView(domain: "example.com", dismissAction: {})
        .previewLayout(.sizeThatFits)
}
