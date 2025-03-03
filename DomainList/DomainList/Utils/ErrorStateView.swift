//
//  ErrorStateView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct ErrorStateView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text(message)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            
            Button("Retry") {
                retryAction()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ErrorStateView(
        message: "An error occurred",
        retryAction: {}
    )
    .background(Color(.systemGray6))
}
