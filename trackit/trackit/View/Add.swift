//
//  Add.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct Add: View {
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
                    Button(action: {
                        print("pressed")
                    }){
                        getAssetImage()
                    }
                }
                
                Section(header: Text("Details")) {
                    VStack {
                        TextField("Name", text: $nameField)
                        TextField("Description", text: $descriptionField)
                        TextField("Location e.g under the master bed", text: $location)
                    }
                }
                
                if isBox {
                    Section(header: Text("Items")) {
                        ForEach(0..<assetTypes.count) { index in
                            Text(self.assetTypes[index].rawValue).tag(self.assetTypes[index].rawValue)
                        }
                        Button(action: {
                            print("button to add items to this box")
                        }) {
                            Text("Add items")
                        }
                    }
                }
            }
        }
    }
    
    func getAssetImage() -> AnyView {
        var _image: Image = Image(systemName: "camera")
        if !image.isEmpty {
            _image = Image(systemName: "camera")
            // fill the image here
        }
        
        if image.isEmpty {
            var view: AnyView = AnyView(
                VStack {
                    Image(systemName: "camera").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                    Text("Add your own image")
                }
            )
            return view
        }
        
        return AnyView(_image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
        )
    }
}
        

struct add_view: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
