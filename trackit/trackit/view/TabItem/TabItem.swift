//
//  TabItem.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 20/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct TabItem<Content : View> : View {
    let content: Content
    let name: String
    let image: String
    
    init(_ name: String, image: String, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.name = name
        self.image = image
    }
    
    var body: some View {
        content.tabItem { tabInfo() }
    }
    
    func tabInfo() -> some View {
        return VStack {
            Image(systemName: image)
            Text(name)
        }
    }
}
