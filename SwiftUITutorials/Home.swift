//
//  Home.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/30/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    Text("iOS Developer")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button(action: {self.showProfile.toggle()}) {
                        // Text("")
                        Image("Brian")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer() // este spacer como esta dentro de verticl stack então o espaço é na vertical para ele puder estar no topo
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous)) // poe as bordas da view redonda
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20) // sombra da view
            .offset(y: showProfile ? -450 : 0) // faz viewPrincipal subir para uma posicao de -450
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10: 0), axis: (x: 10, y: 0, z: 0)) // dá um efeito 3D na viewPrincipal
            .scaleEffect(showProfile ? 0.9 : 1) // diminiu a viewPrincipal quando clicar no botao
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) // animacao quando o menuView aparece
                .edgesIgnoringSafeArea(.all)
            
            
            
            MenuView() // chama o menuView
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : 1000) // quando clicar o botao vai mostrar o menu na posicao 1000 (vertical)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) // animacao quando o menu aparece
                .onTapGesture {
                    self.showProfile.toggle() // quando clicas na viewPrincipal o menuViewDesapaerece
            }
                
            // gesto de arrastar
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.viewState = value.translation

            }
            
            .onEnded { value in
                if self.viewState.height > 50 {
                    self.showProfile = false
                }
                self.viewState = .zero
                
            }
            
            )
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
