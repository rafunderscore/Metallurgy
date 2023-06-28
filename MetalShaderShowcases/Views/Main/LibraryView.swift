//
//  LibraryView.swift
//  MetalShaderShowcases
//
//  Created by Raphael S on 27/06/2023.
//

import SwiftUI

struct LibraryView: View {
    @State var shaders = ShaderShowcases().shaders
    @State var topExpanded = true
    @State private var selectedSorting = SortingOptions.Name
    @State private var selectedCategory = Filters.Color
    @State private var searchText = ""
    @State private var sorted: [MetalShader] = []

    func sortArray() {
        switch selectedSorting {
        case .Name:
            sorted = shaders.sorted(by: { $0.name < $1.name })
        case .Author:
            sorted = shaders.sorted(by: { $0.name < $1.name })
        case .Category:
            sorted = shaders.sorted(by: { $0.name < $1.name })
        case .Newest:
            sorted = shaders.sorted(by: { $0.name < $1.name })
        case .Oldest:
            sorted = shaders.sorted(by: { $0.name < $1.name })
        case .Complexity:
            sorted = shaders.sorted(by: { $0.name < $1.name })
        }
    }

    func filterArray() {
        switch selectedCategory {
        case .Color:
            sorted = shaders.filter { $0.category == .Color }
        case .Distortion:
            sorted = shaders.filter { $0.category == .Distortion }
        case .Layer:
            sorted = shaders.filter { $0.category == .Layer }
        case .None:
            sorted = shaders.filter { $0.category == .None }
        }
    }

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(shaders) { shader in
                        NavigationLink(destination: shader.showcase) {
                            Text(shader.name)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        Section {
                            Picker("Sort by", selection: $selectedSorting) {
                                ForEach(SortingOptions.allCases) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                        }

                        Section {
                            Picker("Filters", selection: $selectedCategory) {
                                ForEach(Filters.allCases) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                        }

                    } label: {
                        Label("Sort by", systemImage: "ellipsis.circle")
                    }.menuStyle(BorderlessButtonMenuStyle())
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LibraryView()
}