//
//  Inventory.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

let list: [Asset] = [Item(id: 1, name: "item"), Box(id: 2, name: "box2")] as! [Asset]

struct Inventory: View {
    private let TAB_NAME: String = "Inventory"
    private let TAB_ICON: String  = "tray.2"

    @State var searchTerm: String = ""
    @State var shouldHide: Bool = true
    @State var showScanner: Bool = false
    
    var body: some View {
        TabItem(TAB_NAME, image: TAB_ICON) {
            NavigationView {
                NavigationController($shouldHide) {
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
                        List(list.filter(search(asset:)), id: \.id) { self.build($0) }
                    }
                }.onAppear {
                    self.shouldHide = true
                }
            }
        }
    }
    
    func build(_ asset: Asset) -> AnyView {
        
        var view: AnyView = AnyView(EmptyView())
        
        switch asset {
        case let item as Item:
            view = AnyView(ItemView(item, shouldNavShow: $shouldHide))
        case let box as Box:
            view = AnyView(BoxView(box, shouldNavShow: $shouldHide))
        default:
            print("Unable to build asset in inventory")
        }
        
        return AnyView(NavigationLink(destination: view) {
            AssetRow(asset: asset)
        })
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
        Inventory().environmentObject(NavigationState())
    }
}

class NavigationState: ObservableObject {
    @Published var isNavigateHidden: Bool = true
}
