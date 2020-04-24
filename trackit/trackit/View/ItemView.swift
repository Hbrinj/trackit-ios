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
    @Binding var shouldNavShow: Bool

    @State private var nameField: String = ""
    var item: Item
    
    init(_ item: Item, shouldNavShow: Binding<Bool>) {
        self.item = item
        self._shouldNavShow = shouldNavShow
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Name")
                TextField("Name", text: $nameField)
            }
        }.navigationBarTitle(item.getText(), displayMode: .inline)
            .onAppear {
                self.shouldNavShow = false
            }
    }
}
