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
    let content: Content
    @Binding var shouldHide: Bool
    init(_ shouldHide: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._shouldHide = shouldHide
    }
    
    var body: some View {
        content
            .navigationBarHidden(shouldHide)
            .navigationBarTitle(EMPTY_TITLE)
    }
}
