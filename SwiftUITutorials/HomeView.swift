//
//  HomeView.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/31/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("iOS Developer")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            
            //ScrollView
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(0 ..< 5) { item in
                        SeccoesView()
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
                
            }
            
            Spacer() // este spacer como esta dentro de verticl stack então o espaço é na vertical para ele puder estar no topo
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}



struct SeccoesView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Tutoriais de SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160 , alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image("Logo1")
            }
            
            Text("18 Secções".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275) // dimensacao da v stack
        .background(Color("card1")) // cor de fundo
        .cornerRadius(30) // bordas
        .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
