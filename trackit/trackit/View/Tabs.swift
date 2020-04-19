//
//  ContentView.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Inventory()
                .tag(0)
            Text("Add")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Add")
                    }
            }.tag(1)
            Text("Find")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Scan")
                    }
                }
                .tag(2)
        }
    }
}

struct tabs_view: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
