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
            asset.image
            Text(asset.name)
            Spacer()
        }
    }
}


struct asset_view: PreviewProvider {
    static var previews: some View {
        AssetRow(asset: Asset(id: 1, name: "Test"))
    }
}
