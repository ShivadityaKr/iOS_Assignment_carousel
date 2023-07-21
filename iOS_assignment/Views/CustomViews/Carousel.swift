//
//  Carousel.swift
//  iOS_assignment
//
//  Created by Shivaditya Kr on 20/07/23.
//

import SwiftUI

struct Carousel: View {
    @State private var currentPage = 0
    var imageList: [String]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<imageList.count) { index in
                    HStack {
                        Image(imageList[index])
                            .resizable()
                            .tag(index)
                    }
                    .frame(height: 150)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            PageControl(numberOfPages: imageList.count, currentPage: $currentPage)
        }
        .frame(height: 200)
        .padding(.horizontal, 10)
    }
}
