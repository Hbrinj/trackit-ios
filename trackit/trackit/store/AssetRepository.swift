//
//  AssetRepository.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 26/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI
import RealmSwift

class AssetRepository: ObservableObject {
    @Published var assets: Results<Asset>
    // MARK: Realm
    private let realm: Realm
    private var token: NotificationToken? = nil
    private let currentSchemaVersion: UInt64 = 2
    
    init() {
        var conf = Realm.Configuration.init()
        conf.deleteRealmIfMigrationNeeded = true
        conf.schemaVersion = currentSchemaVersion
        realm = try! Realm(configuration: conf)
        assets = realm.objects(Asset.self)
    }
    //MARK: Private functions
    
    
    //MARK: Public functions
    func add(_ asset: Asset) {
        try! realm.write {
            realm.add(asset)
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let realm2 = assets.realm {
            offsets.forEach { index in
                let asset = assets[index]
                try! realm2.write {
                    realm2.delete(asset)
                }
            }
        }
    }
    
    func update(block: (() -> ())) {
        try! realm.write(block)
    }
    
    func findby(_ id: String) -> Asset {
        return assets.filter(NSPredicate(format: "id == %@", id)).first!
    }
    
    deinit {
        token?.invalidate()
    }
}
