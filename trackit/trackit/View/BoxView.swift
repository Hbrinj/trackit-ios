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
    var box: Box
    var body: some View {
        box.getText().foregroundColor(.green)
    }
}
