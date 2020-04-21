//
//  Add.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI



struct Add: View {
    private let TAB_NAME: String = "Add"
    private let TAB_ICON: String = "magnifyingglass"
    
    var body: some View {
        TabItem(TAB_NAME, image: TAB_ICON) {
            Text("add")
        }
    }
}

struct add_view: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
