//
//  Inventory.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

let list = [Asset(id: 1, name: "box1"), Asset(id: 2, name: "box2")]

struct Inventory: View {
    var body: some View {
        VStack (alignment: .center){
            
            Text("Search bar")
            List(list, id: \.id) { asset in
                AssetRow(asset: asset)
            }
        }
        .tabItem {
            VStack {
                Image("first")
                Text("Inventory")
            }
        }
    }
}

struct inventory_view: PreviewProvider {
    static var previews: some View {
        Inventory()
    }
}
