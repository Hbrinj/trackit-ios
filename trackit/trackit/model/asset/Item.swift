//
//  File.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 20/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct Item: Asset, Codable, Hashable {
    var id: Int
    var name: String
    var description: String?
    var location: String?
    var image: String?
    var type: AssetType = .item
    
    func getImage() -> Image {
        return Image(systemName: "doc")
    }
    
    func getText() -> Text {
        return Text(name)
    }
    
}
