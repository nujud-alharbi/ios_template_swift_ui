//
//  ContentView.swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 22/11/1444 AH.
//
//
//import Foundation
//import SwiftUI
//
//struct ContentView: View {
//    @EnvironmentObject var cartManager: CartManager
//
//    var body: some View {
//        TabView {
//            DashBoardScreen()
//                .tabItem {
//                    Image(systemName: "")
//                    Text("DashBoard")
//                }
//            ProductScreen()
//                .tabItem {
//                    Image(systemName: "")
//                    Text("Product")
//                }
//            OrderScreen()
//                .tabItem {
//                    Image(systemName: "")
//                    Text("Order")
//                }
//                .badge(cartManager.cart.count)
//            UsersSscreen()
//                .tabItem {
//                    Image(systemName: "")
//                    Text("Users")
//                }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//            ContentView()
//
//        }
//    }
//}
