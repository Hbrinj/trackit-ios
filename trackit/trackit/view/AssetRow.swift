//
//  AssetRow.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 19/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct AssetRow: View {
    var asset: Asset
    
    var body: some View {
         HStack {
            getImage()
            Text(asset.name)
            Spacer()
        }
    }
    
    func getImage() -> Image {
        switch(asset.type) {
        case .box:
            return Image(systemName: "cube.box")
        case .item:
            return Image(systemName: "doc")
        }
    }
}

struct asset_view: PreviewProvider {
    static var previews: some View {
        AssetRow(asset: Asset())
    }
}
