//
//  ListView.swift
//  iOS_assignment
//
//  Created by Shivaditya Kr on 20/07/23.
//

import SwiftUI

struct ListView: View {
    
    
    @State private var listElement: [String] = []
    @State private var searchedText: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                List {
                    Section {
                        Group {
                            if self.searchedText.isEmpty {
                                Carousel(imageList: ListViewDatsource.imageList)
                            }
                        }
                        
                    }
                    Section(header: SearchBarView(searchText: $searchedText, onEditingChanged: searchedTextDidChange))
                    {
                        ForEach(listElement, id: \.self) { element in
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
    
    func searchedTextDidChange(_ editing: Bool) {
        self.searchedTextDidChange(text: self.searchedText)
    }
    
    func searchedTextDidChange(text: String) {
        if text.isEmpty {
            self.listElement = ListViewDatsource.largeList
        } else {
            let filteredList = ListViewDatsource.largeList.filter { element in
                let searchText = text.lowercased()
                let elementLowercased = element.lowercased()
                return elementLowercased.contains(searchText) || elementLowercased.hasPrefix(searchText)
            }
            self.listElement = filteredList
        }
    }
}

struct ListViewDatsource {
    // For Carousel
    static var imageList: [String] = ["bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water"]
    // For List
    static var largeList: [String] = ["bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water", "bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water", "bridge","desert", "laptop", "mouse", "riksha", "river", "sea", "table", "water"]
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
