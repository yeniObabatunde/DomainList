//
//  DomainPurchaseView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct DomainPurchaseView: View {
    let domain: Domain
    @ObservedObject var viewModel: DomainSearchViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var showingConfirmation = false
    @State private var showingSuccessPage = false
    @State private var years = 1
    
    var body: some View {
        ZStack {
            if !showingSuccessPage {
                VStack(spacing: 0) {
                    PurchaseHeaderView(
                        domain: domain.domain ?? "domainforsale.com",
                        dismissAction: { dismiss() }
                    )
                    Spacer()
                    VStack {
                        PurchaseDetailsView(price: domain.price)
                        
                        PurchaseButtonView(action: {
                            showingConfirmation = true
                        })
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
                }
                .background(Color(.systemGray6))
                .navigationBarHidden(true)
                .confirmationDialog(
                    "Confirm Purchase",
                    isPresented: $showingConfirmation,
                    titleVisibility: .visible
                ) {
                    Button("Purchase \(domain.domain ?? "this domain")") {
                        let success = viewModel.purchase(domain)
                        if success {
                            showingSuccessPage = true
                        }
                    }
                    
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("Are you sure you want to purchase this domain for $\(Int(domain.price))?")
                }
            } else {
                SuccessPageView(
                    domain: domain.domain ?? "this domain",
                    dismissAction: { dismiss() }
                )
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    DomainPurchaseView(domain: Domain.example, viewModel: DomainSearchViewModel())
}
