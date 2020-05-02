//
//  ContentView.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    @EnvironmentObject var navigationState: NavigationState
    @EnvironmentObject var assetRepo: AssetRepository
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Inventory().tag(0)
            Add().tag(1)
        }
    }
}

struct tabs_view: PreviewProvider {
    static var previews: some View {
        Tabs()
            .environmentObject(NavigationState())
            .environmentObject(AssetRepository())
    }
}
