//
//  Home.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/30/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false // para mostrar o perfil
    @State var viewState = CGSize.zero // para ter controller sobre o gesture
    @State var showContent = false
    
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HomeView(showProfile: $showProfile, showContent: $showContent)  // O cabeçalho Foto e texto
                    .padding(.top, 44)
                    .background(
                        VStack {
                            LinearGradient(gradient: Gradient(colors: [Color("background2"), Color.white]), startPoint: .top, endPoint: .bottom)
                                .frame(height: 200)
                            Spacer()
                        }
                        .background(Color.white)
                
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous)) // poe as bordas da view redonda
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20) // sombra da view
                    .offset(y: showProfile ? -450 : 0) // faz viewPrincipal subir para uma posicao de -450
                    .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10: 0), axis: (x: 10, y: 0, z: 0)) // dá um efeito 3D na viewPrincipal
                    .scaleEffect(showProfile ? 0.9 : 1) // diminiu a viewPrincipal quando clicar no botao
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) // animacao quando o menuView aparece
                    .edgesIgnoringSafeArea(.all)
            }
            
            
            
            MenuView() // chama o menuView
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height) // quando clicar o botao vai mostrar o menu na posicao dependendo do tamanho do telefone (vertical)
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
            
            // quando mostrar o cartão
            if showContent {
                
                //fundo branco
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                //mostra o cartão
                ContentView()
                
                
                //botao sair
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture {
                    self.showContent = false
                }
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct AvatarView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
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
}


//dimensoes do telefone
let screen = UIScreen.main.bounds
