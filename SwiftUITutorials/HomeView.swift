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
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in // por os dados estaticos numa scrollview
                        GeometryReader { geometry in
                            SeccoesView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0)) // 3D SCROLL ANimantion
                        }
                        .frame(width: 275, height: 275)
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
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160 , alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
            .frame(width: 275, height: 275) // dimensacao da v stack
            .background(section.color) // cor de fundo
            .cornerRadius(30) // bordas
            .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData =
    [
        Section(title: "Tutoriais de SwuiftUi", text: "18 secções", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
        Section(title: "Tutoriais de swuift 5", text: "40 secções", logo: "Logo1", image: Image("Card2"), color: Color("card2")),
        Section(title: "Tutoriais de iOS Development", text: "120 secções", logo: "Logo1", image: Image("Card3"), color: Color("card3")),
        Section(title: "Tutoriais de Node.js", text: "50 secções", logo: "Logo2", image: Image("Card4"), color: Color("card4"))
        
]
