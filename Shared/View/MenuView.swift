//
//  MenuView.swift
//  LCS Eats
//
//  Created by Doggett, Scott on 2021-01-28.
//

import SwiftUI

struct MenuView: View {
        
    @ObservedObject var store: OrderStore
    
    @State private var menu = Menu()
    
    @State private var cart: [Item] = []
        
    @Binding var restaurantChoice: Restaurant
    
    @Binding var orderName: String
    
    @Binding var orderphoneNumberOrEmail: String
    
    var body: some View {
        
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
                            cart.append(item)
                        }) {
                            Image(systemName: "plus.circle")
                        }
                    }
                }.navigationTitle("Mcdonalds Menu")
            }.toolbar {
                Button(action: {
                    for item in cart {
                        print(item.name)
                    }
                }) {
                    Image(systemName: "cart")
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
            MenuView(store: testStore, restaurantChoice: .constant(Restaurant.mcdonalds), orderName: .constant("Scott"), orderphoneNumberOrEmail: .constant("555555555"))
            
        }
    }
}
