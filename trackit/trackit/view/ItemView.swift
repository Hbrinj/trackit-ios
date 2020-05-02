//
//  ItemView.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 20/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemView: View {
    var item: Asset
    
    var body: some View {
        VStack {
            getAssetImage()
            List {
                Text(item.location ?? "somewhere").foregroundColor(.gray).frame(maxWidth: .infinity)
                if (!(item.assetDescription?.isEmpty ?? true)) {
                    VStack (alignment: .leading){
                        Text("Description").fontWeight(.light)
                        Spacer()
                        Text(item.assetDescription ?? "")
                    }
                }
            }
        }
    }
    
    func getAssetImage() -> AnyView {
        var _image: Image = Image(systemName: "doc")
        let hasImage = (item.imagePath?.isEmpty ?? false)
        if hasImage {
               _image = Image(systemName: "doc")
               // fill the image here
           }
           
        if !hasImage {
           var view: AnyView = AnyView(
               VStack {
                Image(systemName: "camera").resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(maxWidth: .infinity, maxHeight: 200)
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
