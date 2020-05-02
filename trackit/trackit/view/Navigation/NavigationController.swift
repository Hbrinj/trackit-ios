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
    private let EMPTY_TITLE: String = ""
    private let content: Content
    @EnvironmentObject var navigationState: NavigationState
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .navigationBarHidden(navigationState.hideNavigation)
            .navigationBarTitle(EMPTY_TITLE)
    }
}
