//
//  Asset.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct Asset: Codable, Hashable {
    var id: Int
    var name: String
    
    var image: Image {
        Image("first")
    }
}
