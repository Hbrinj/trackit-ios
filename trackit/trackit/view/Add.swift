//
//  Add.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct Add: View {
    @EnvironmentObject var assetRepo: AssetRepository
    private let TAB_NAME: String = "Add"
    private let TAB_ICON: String = "plus"
    private let assetTypes: [AssetType] = AssetType.allCases.reversed()
    
    @State private var nameField: String = ""
    @State private var descriptionField: String = ""
    @State private var location: String = ""
    @State private var image: String = ""
    @State private var type: String = AssetType.item.rawValue
    private var isBox: Bool {
        return (type == AssetType.box.rawValue)
    }
    
    var body: some View {
        TabItem(TAB_NAME, image: TAB_ICON) {
            Form {
                Section {
                    Picker(selection: $type, label: Text("What would you like to create")) {
                        ForEach(0..<assetTypes.count) { index in
                            Text(self.assetTypes[index].rawValue).tag(self.assetTypes[index].rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                   AssetImageView(imagePath: $image)
                }
                
                Section(header: Text("Details")) {
                    AssetDetailsView(nameField: $nameField,
                                     descriptionField: $descriptionField,
                                     locationField: $location)
                }
                
                if isBox {
                    Section(header: Text("Items")) {
                        BoxItemsView(boxAssets: assetRepo.assets)
                        Button(action: { print("button to add items to this box") }) {
                            Text("Add items")
                        }
                    }
                }
                HStack {
                    Spacer()
                    Button(action: self.add) {
                        Text("Add")
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: self.add) {
                        Text("Cancel").foregroundColor(.red)
                    }
                    Spacer()
                }
            }
        }
    }
    
    func add() {
        var asset: Asset
        if isBox {
            let box = Asset()
            box.type = .box
            box.name = nameField
            box.assetDescription = descriptionField
            box.location = location
            box.imagePath = image
            
            asset = box
        } else {
            let item = Asset()
            item.type = .item
            item.name = nameField
            item.assetDescription = descriptionField
            item.location = location
            item.imagePath = image
            
            asset = item
        }
        clear()
        assetRepo.add(asset)
    }
    
    func clear() {
        type = AssetType.item.rawValue
        descriptionField = ""
        image = ""
        location = ""
        
    }
    
}
        

struct add_view: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
