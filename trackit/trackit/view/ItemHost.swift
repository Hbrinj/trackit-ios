//
//  ItemHost.swift
//  trackit
//
//  Created by Houman Brinjcargorabi on 26/04/2020.
//  Copyright © 2020 Houman Brinjcargorabi. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemHost: View {
    var item: Asset
    @EnvironmentObject var navigationState: NavigationState
    
    @Environment(\.editMode) private var mode
    @State private var isEditing = false

    var body: some View {
        VStack {
            if self.isEditing {
                ItemEditView(item: item, isEditing: $isEditing)
            } else {
                ItemView(item: item)
            }
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(leading: cancelButton(), trailing: editButton())
        .onAppear {
            self.navigationState.hideNavigation = false
        }
    }
    
    func editButton() -> AnyView {
        return AnyView(Button(action: self.edit) {
            if(self.isEditing) {
                Text("Cancel").foregroundColor(.red)
            } else {
                Text("Edit")
            }
        })
    }
    
    func cancelButton() -> AnyView {
        if self.mode?.wrappedValue == .inactive {
            return AnyView(EmptyView())
        }
        return AnyView(Button(action: self.cancel) {
            Text("Cancel")
        })
    }
    
    func edit() {
        withAnimation(.easeInOut) {
            self.isEditing.toggle()
        }
    }
    
    func cancel() {
        self.mode?.wrappedValue = .inactive
    }
}
