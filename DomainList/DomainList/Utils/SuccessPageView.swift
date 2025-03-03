//
//  SuccessPageView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct SuccessPageView: View {
    let domain: String
    let dismissAction: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .foregroundColor(.green)
            VStack(spacing: 16) {
                Text("Congratulations!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("You have successfully purchased")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Text(domain)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            Button(action: dismissAction) {
                Text("Done")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(28)
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

#Preview {
    SuccessPageView(domain: "example.com", dismissAction: {})
}
