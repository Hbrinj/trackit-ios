//
//  NavigationController.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 21/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct NavigationController<Content: View> : View {
    let content: Content
    @Binding var show: Bool
    let name: String
    
    init(_ name: String, show: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.name = name
        self._show = show
    }
    
    var body: some View {
        content
            .navigationBarHidden(show)
            .navigationBarTitle(name)
    }
}
