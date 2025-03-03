//
//  PurchaseDetailsView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct PurchaseDetailsView: View {
    let price: Double
    @State private var years: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Registration price")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text("$\(Int(price))")
                    .font(.system(size: 60, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            
            HStack {
                Text("Years to register")
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack(spacing: 12) {
                    Button(action: {
                        if years > 1 {
                            years -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    
                    Text("\(years) \(years == 1 ? "year" : "years")")
                        .fontWeight(.medium)
                    
                    Button(action: {
                        years += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding(4)
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
                
                Text("$\(Int(price) * years)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    PurchaseDetailsView(price: 100.0)
        .padding()
        .previewLayout(.sizeThatFits)
}
