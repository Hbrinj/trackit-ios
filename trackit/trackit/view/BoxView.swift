//
//  File.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 20/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct BoxView: View {
    @EnvironmentObject var navigationState: NavigationState
    var box: Asset

    var body: some View {
        Text(box.name).foregroundColor(.green).navigationBarTitle(Text(box.name), displayMode: .inline)
        .onAppear {
            self.navigationState.hideNavigation = false
        }
    }
}
