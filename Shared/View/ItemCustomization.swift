//
//  ItemCustomization.swift
//  LCS Eats
//
//  Created by Doggett, Scott on 2021-03-05.
//

import SwiftUI

struct ItemCustomization: View {
    
    @Binding var showingItemCustomization: Bool
    
    @State private var size = Size.medium
    
    @State var menu = Menu()
    
    var item: Item
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            Form {
                Text(item.name)
                
                if item.name == "Coke" {
                    Picker("Size", selection: $size) {
                        Text(Size.small.rawValue).tag(Size.small)
                        Text(Size.medium.rawValue).tag(Size.medium)
                        Text(Size.large.rawValue).tag(Size.large)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            }.navigationBarTitle(item.name, displayMode: .inline)
        }
    }
}

struct ItemCustomization_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemCustomization(showingItemCustomization: .constant(true), item: testItem)
        }
    }
}
