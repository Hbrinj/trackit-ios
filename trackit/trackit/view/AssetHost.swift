//
//  AssetView.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 26/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct AssetHost: View {
   var asset: Asset
    
    var body: some View {
        build(asset)
    }
    
    func build(_ asset: Asset) -> AnyView {
        switch asset.type {
        case .item:
            return AnyView(ItemHost(item: asset))
        case .box:
            return AnyView(BoxView(box: asset))
        default:
            print("Unable to build asset in inventory")
            return AnyView(EmptyView())
        }
    }
}
