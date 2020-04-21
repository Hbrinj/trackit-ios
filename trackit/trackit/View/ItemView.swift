//
//  ItemView.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 20/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemView: View {
    var item: Item
    @Binding var isNavigationHidden: Bool
    var body: some View {
        item.getText().onAppear {
            self.isNavigationHidden = false
        }
    }
}
