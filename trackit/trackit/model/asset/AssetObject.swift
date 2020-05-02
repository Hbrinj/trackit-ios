//
//  AssetObject.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 29/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import RealmSwift

//protocol Asset {
//    var id: String { get }
//    var name: String { get set }
//    var type: AssetType { get set }
//    var assetDescription: String? { get set }
//    var imagePath: String? { get set }
//    var location: String? { get set }
//}

class Asset: Object {
    var type: AssetType {
        get { return AssetType(rawValue: privateType)! }
        set { privateType = newValue.rawValue}
    }
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic private var privateType: String = ""
    @objc dynamic var assetDescription: String?
    @objc dynamic var imagePath: String?
    @objc dynamic var location: String?
    @objc dynamic var box: Asset?
    let items = List<Asset>()
    
    override static func primaryKey() -> String? {
      return "id"
    }
}
