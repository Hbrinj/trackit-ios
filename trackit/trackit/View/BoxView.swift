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
    @Binding var shouldNavShow: Bool
    private var box: Box
    
    init(_ box: Box, shouldNavShow: Binding<Bool>) {
        self.box = box
        self._shouldNavShow = shouldNavShow
    }
    
    var body: some View {
        box.getText().foregroundColor(.green).navigationBarTitle(box.getText(), displayMode: .inline)
        .onAppear {
            self.shouldNavShow = false
        }
    }
}
