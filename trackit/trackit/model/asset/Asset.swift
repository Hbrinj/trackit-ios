//
//  Asset.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

protocol Asset{
    var id: Int { get set }
    var type: AssetType { get set }
    var name: String { get set }
    var image: String? { get set }
    var location: String? { get set }
    
    func getImage() -> Image
    func getText() -> Text
}
