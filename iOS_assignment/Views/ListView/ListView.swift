//
//  ListView.swift
//  iOS_assignment
//
//  Created by Shivaditya Kr on 20/07/23.
//

import SwiftUI

struct ListView: View {
    @State private var listElements: [String] = []
    @State private var searchedText: String = ""
    var body: some View {
        ZStack {
            Color.white
            VStack {
                // MARK: List
                List {
                    // MARK: Carousel Section
                    Section {
                        Group {
                            if self.searchedText.isEmpty {
                                Carousel(imageList: ListViewDatsource.imageList)
                            }
                        }
                    }
                    // MARK: Searchbar Section
                    Section(header: SearchBarView(searchText: $searchedText, onEditingChanged: searchedTextDidChange))
                    {
                        ForEach(listElements, id: \.self) { element in
                            HStack(spacing: 10) {
                                Image(element)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Spacer()
                                Text(element)
                                Spacer()
                            }
                            .frame(height: 60)
                            .padding(.horizontal, 20)
                        }
                    }
                }
                .listStyle(.plain)
                .padding(.top, 10)
            }
        }
        .onAppear() {
            self.searchedTextDidChange(text: self.searchedText)
        }
    }
    // MARK: SearchTextCallBack
    func searchedTextDidChange(_ editing: Bool) {
        self.searchedTextDidChange(text: self.searchedText)
    }
    // MARK: Searching Algorithm
    func searchedTextDidChange(text: String) {
        if text.isEmpty {
            self.listElements = ListViewDatsource.largeImageList
        } else {
            let filteredList = ListViewDatsource.largeImageList.filter { element in
                let searchText = text.lowercased()
                let elementLowercased = element.lowercased()
                return elementLowercased.contains(searchText) || elementLowercased.hasPrefix(searchText)
            }
            self.listElements = filteredList
        }
    }
}

struct ListViewDatsource {
    // MARK: Carousel Data
    static var imageList: [String] = ["bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water"]
    // MARK: List Section
    static var largeImageList: [String] = ["bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water", "bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water", "bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water"]
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
