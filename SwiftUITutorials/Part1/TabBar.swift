//
//  TabBar.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 5/1/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        // criar um tabbar
        TabView {
            Home() // a view
                .tabItem { // botoes
                    Image(systemName: "play.circle.fill")
                    Text("Home")
            }
            ContentView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Cartão")
            }
            
            
        }
        //.edgesIgnoringSafeArea(.top)
    }
}




struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        
        // mostrar a layout em varios devices
        Group {
            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 11 Pro Max")
        }
    }
}
