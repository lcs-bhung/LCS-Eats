//
//  MenuView.swift
//  LCS Eats
//
//  Created by Doggett, Scott on 2021-01-28.
//

import SwiftUI

struct MenuView: View {
    
    // Weather to show this view
    @Binding var showingMenu: Bool
    
    @State private var showingItemCustomization = false
    
    @ObservedObject var store: OrderStore
    
    @State var menu = Menu()
    
    @State private var itemIndex = 2
    
    var body: some View {
        
        let restaurantChoice = store.orders[store.orders.count-1].restaurant
        
        if restaurantChoice.rawValue == "Mcdonalds" {
            Form {
                ForEach(menu.mcdonaldsMenu, id: \.id) { item in
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70, alignment: .center)
                        Text(item.name)
                        
                        Spacer()
                        
                        Button(action: {
                            showingItemCustomization = true
                        }) {
                            Image(systemName: "arrow.forward.circle")
                        }
                    }
                }.sheet(isPresented: $showingItemCustomization) {
                    ItemCustomization(showingItemCustomization: $showingItemCustomization)
                }
            }
        } else if restaurantChoice.rawValue == "Tim Hortons" {
            Form {
                ForEach(0..<menu.timsmenu.count) { item in
                    Toggle(isOn: $menu.timsmenu[item].itemChosen) {
                        HStack {
                            Image(menu.timsmenu[item].imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70, alignment: .center)
                            Text(menu.timsmenu[item].name)
                        }
                    }
                }
            }
        } else if restaurantChoice.rawValue == "Pizza Hut" {
            Form {
                
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView(showingMenu: .constant(true), store: testStore, menu: testMenu)
            
        }
    }
}
