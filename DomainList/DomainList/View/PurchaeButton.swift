//
//  PurchaeButton.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct PurchaseButtonView: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
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
}
