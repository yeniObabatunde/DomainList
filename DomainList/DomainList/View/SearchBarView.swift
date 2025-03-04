//
//  SearchBarView.swift
//  DomainList
//
//  Created by Sharon Omoyeni Babatunde on 03/03/2025.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $text)
                    .foregroundColor(.primary)
                    .autocorrectionDisabled(true)
            }
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(20)
        .background(Color(.lightGray.withAlphaComponent(0.1)))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView(text: .constant(""), placeholder: "Search for a domain")
}
