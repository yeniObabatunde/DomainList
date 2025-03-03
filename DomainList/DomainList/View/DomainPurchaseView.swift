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
    @State private var isPurchased = false
    @State private var showingConfirmation = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
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
            
            Text(domain.domain ?? "domainforsale.com")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            Spacer()
            
            VStack(spacing: 20) {
              
                VStack(alignment: .leading, spacing: 8) {
                    Text("Registration price")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Text("$\(Int(domain.price))")
                        .font(.system(size: 60, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
                HStack {
                    Text("Years to register")
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                        
                        Text("1 year")
                            .fontWeight(.medium)
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                    }
                }
               
                HStack {
                    Text("Domain privacy")
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Included")
                        .fontWeight(.medium)
                }
                HStack {
                    Text("SSL certificate")
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Included")
                        .fontWeight(.medium)
                }
                
                Divider()
                    .padding(.vertical)
                HStack {
                    Text("Total")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("$\(Int(domain.price))")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Button(action: {
                    let success = viewModel.purchase(domain)
                    if success {
                        showingConfirmation = true
                    }
                }) {
                    Text("Purchase domain")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(28)
                }
                .padding(.vertical)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16, corners: [.topLeft, .topRight])
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
        }
        .navigationBarHidden(true)
        .background(Color(.systemGray6))
        .alert("Success!", isPresented: $showingConfirmation) {
            Button("OK") {
                isPurchased = true
                dismiss()
            }
        } message: {
            Text("You have successfully purchased \(domain.domain ?? "this domain")")
        }
        .onChange(of: isPurchased) { newValue in
            if newValue {
                dismiss()
            }
        }
    }
}
