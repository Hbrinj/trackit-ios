//
//  ItemEditView.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 26/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemEditView: View {
    private let origItem: Asset
    @State private var nameField: String = ""
    @State private var descriptionField: String = ""
    @State private var location: String = ""
    @State private var image: String = ""
    @Binding private var isEditing: Bool
    @EnvironmentObject var assetRepo: AssetRepository
    
    init(item i: Asset, isEditing: Binding<Bool>) {
        origItem = i
        self._isEditing = isEditing
    }
    
    var body: some View {
        Form {
            Section {
                AssetImageView(imagePath: $image)
            }
            Section(header: Text("Details")) {
                AssetDetailsView(nameField: $nameField,
                                 descriptionField: $descriptionField,
                                 locationField: $location)
            }
            
            Section {
                HStack{
                    Spacer()
                    Button(action: self.update) { Text("Done") }
                    Spacer()
                }
            }
        }.onAppear(perform: self.setItemValues)
    }
    
    func setItemValues() {
        self.nameField = self.origItem.name
        self.descriptionField = self.origItem.assetDescription ?? ""
        self.image = self.origItem.imagePath ?? ""
        self.location = self.origItem.location ?? ""
    }
    
    func update() {
        assetRepo.update {
            self.origItem.name = nameField
            self.origItem.assetDescription = descriptionField
            self.origItem.imagePath = image
            self.origItem.location = location
            return
        }
        withAnimation(.easeInOut) {
            isEditing.toggle()
        }
    }
}

struct ItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
