//
//  Inventory.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct Inventory: View {
    @EnvironmentObject var navigationState: NavigationState
    @EnvironmentObject var assetRepo: AssetRepository

    private let TAB_NAME: String = "Inventory"
    private let TAB_ICON: String  = "tray.2"

    @State var searchTerm: String = ""
    @State var showScanner: Bool = false
    
    var body: some View {
        TabItem(TAB_NAME, image: TAB_ICON) {
            NavigationView {
                NavigationController {
                    VStack {
                        HStack {
                            SearchBar(searchTerm: $searchTerm)
                            Button(action: self.qrScanner) {
                                Image(systemName: "qrcode.viewfinder")
                            }.sheet(isPresented: $showScanner) {
                                Text("Scanner")
                            }
                            Spacer()
                        }
                        List {
                            ForEach(assets(), id: \.self.id) {
                                asset in
                                NavigationLink(destination: AssetHost(asset: asset)) {
                                    AssetRow(asset: asset)
                                }
                            }.onDelete(perform: delete(at:))
                        }
                    }
                }.onAppear {
                    self.navigationState.hideNavigation = true;
                }
            }
        }
    }
    
    func assets() -> [Asset] {
        return assetRepo.assets
            .filter(search(asset:))
    }
    
    func isValid(asset: Asset) -> Bool {
        return !asset.isInvalidated
    }
 
    func delete(at indexSet: IndexSet) {
        assetRepo.delete(at: indexSet)
    }
    
    func search(asset: Asset) -> Bool {
        return searchTerm.isEmpty ? true : asset.name.lowercased().contains(searchTerm.lowercased())
    }
    
    func qrScanner() {
        self.showScanner.toggle()
        print("navigating")
    }
}

struct inventory_view: PreviewProvider {
    static var previews: some View {
        Inventory().environmentObject(NavigationState()).environmentObject(AssetRepository())
    }
}
