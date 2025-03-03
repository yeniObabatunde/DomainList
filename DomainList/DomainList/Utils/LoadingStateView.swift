//
//  LoadingStateView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct LoadingStateView: View {
    var body: some View {
        VStack {
            ProgressView()
                .controlSize(.large)
            
            Text("Searching...")
                .foregroundColor(.gray)
                .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingStateView()
        .background(Color(.systemGray6))
}
