//
//  Pagecontrol.swift
//  iOS_assignment
//
//  Created by Shivaditya Kr on 20/07/23.
//

import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfPages, id: \.self) { pageIndex in
                Circle()
                    .foregroundColor(currentPage == pageIndex ? .blue : .gray)
                    .frame(width: currentPage == pageIndex ? 10 : 6, height: currentPage == pageIndex ? 10 : 6)
            }
        }
    }
}
