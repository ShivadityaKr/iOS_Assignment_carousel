//
//  Searchbox.swift
//  iOS_assignment
//
//  Created by Shivaditya Kr on 20/07/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onEditingChanged: (Bool) -> Void
    var body: some View {
        ZStack {
            Color.gray
            TextField("Search", text: $searchText, onEditingChanged: onEditingChanged)
                .foregroundColor(.black)
                .frame(height: 40)
                .multilineTextAlignment(.center)
                .textFieldStyle(.plain)
                .cornerRadius(20)
                .background(Color.white)
                .padding(.horizontal, 10)
        }
        .frame(height: 60)
        .onChange(of: searchText) { newValue in
            onEditingChanged(false) 
        }
    }
}
