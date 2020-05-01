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
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("iOS Developer")
                    //.font(.system(size: 28, weight: .bold))
                    .modifier(CustomFontModifiers(size: 28))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                    .sheet(isPresented: $showUpdate){ // mostrar uma outra janele
                        // ContentView() // cartão
                        UpdateList() // Lista
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            
            
            // circular progress
            ScrollView(.horizontal, showsIndicators: false) {
                WatchRingsView()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
            }
            
            
            
            
            
            
            
            
            
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

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 12) {
                RingView(color1: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifiers(style: .subheadline))
                    Text("10 minutes today")
                        .modifier(FontModifiers(style: .caption))
                }
                .modifier(FontModifiers()) 
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            
            // outra circular progress
            HStack(spacing: 12) {
                RingView(color1: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 32, height: 32, percent: 30, show: .constant(true))
                    .modifier(FontModifiers())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            
            // outra circular progress
            HStack(spacing: 12) {
                RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), width: 32, height: 32, percent: 50, show: .constant(true))
                    .modifier(FontModifiers())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
        }
    }
}
