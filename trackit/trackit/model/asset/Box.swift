//
//  Box.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 20/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct Box: Asset, Codable, Hashable {
    var id: Int
    var name: String
    var description: String?
    var location: String?
    var items: [Int] = []
    
    var image: String?
    var type: AssetType = .box
    
    func getImage() -> Image {
        Image(systemName: "cube.box")
    }
    
    func getText() -> Text {
        Text(name)
    }
}
