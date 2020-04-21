//
//  SearchBar.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var searchTerm: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator($searchTerm)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        return prepareUISearchBar(context)
    }
    
    func prepareUISearchBar(_ context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) { }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var searchTerm: String

        init(_ searchTerm: Binding<String>) {
            _searchTerm = searchTerm
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchTerm = searchText
        }
    }
}
