//
//  AssetDetailsView.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 02/05/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI
import RealmSwift

struct AssetDetailsView: View {
    @Binding var nameField: String
    @Binding var descriptionField: String
    @Binding var locationField: String
    
    var body: some View {        
        VStack {
            TextField("Name", text: $nameField)
            TextField("Description", text: $descriptionField)
            TextField("Location e.g under the master bed", text: $locationField)
        }
    }
}

struct assetDetailsView_view: PreviewProvider {
    static var previews: some View {
        AssetDetailsView(nameField: .constant(""), descriptionField: .constant(""), locationField: .constant(""))
    }
}

struct AssetImageView: View {
    @Binding var imagePath: String
    var body: some View {
        Button(action: { print("pressed") }){ getAssetImage() }
    }
    
    func getAssetImage() -> AnyView {
        var _image: Image = Image(systemName: "camera")
        if !imagePath.isEmpty {
            _image = Image(systemName: "camera")
            // fill the image here
        }
        
        if imagePath.isEmpty {
            var view: AnyView = AnyView(
                VStack {
                    Image(systemName: "camera").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200)
                    Text("Add your own image")
                }
            )
            return view
        }
        
        return AnyView(_image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200)
        )
    }
}

struct BoxItemsView: View {
    var boxAssets: Results<Asset>
    var body: some View {
        List {
            ForEach(boxAssets, id: \.self.id) {
                asset in
                NavigationLink(destination: AssetHost(asset: asset)) {
                    AssetRow(asset: asset)
                }
            }
        }

    }
}
