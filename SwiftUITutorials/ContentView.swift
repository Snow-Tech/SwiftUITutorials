//
//  ContentView.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/28/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    
    var body: some View {
        
        ZStack {
            
            TitleSubView()
                .blur(radius: show ? 20 : 0) // efeito blur (quanto menor o valor menos desfocado será)
                .opacity(showCard ? 0.4 : 1) //opacidade do fundo quando o menu é mostrado
                .offset(y: showCard ? -100 : 0) // movimenta para cima o fundo (valor negativo é para cima, positivo para baixo)
                .animation(
                    Animation
                        .default
                        .delay(0.1) // atraso
                    //                    .speed(2) // velocidade
                    //                    .repeatCount(3) // repete a animacao
                    
            ) // dá a animacao
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220) // a dimensao da stack principal (VStack)
                .background(show ? Color("card3") : Color("card4")) // cor do fundo
                .cornerRadius(20) // bordas
                .shadow(radius: 20) //sombra
                .offset(x: 0, y: show ? -350 : -40) // move na horizontal(x) ou na vertical(y)
                .offset(x: viewState.width, y: viewState.height) // quando começar a arrasta o viewsatate vai receber os valores e atualizar
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 :0.9) // da um efeito tipo escala
                .rotationEffect(.degrees(show ? 0 : 10)) // da efeito de rotacao
                 .rotationEffect(.degrees(showCard ? -10 : 0)) // da o efeito quando o menu aparece ele fica alinhado
                .rotation3DEffect(Angle(degrees: showCard ? 0 :10), axis: (x: 10, y: 0, z: 0)) // da efeito de rotacao 3d e defimos em que eixo queremos esse efeito (x,y,z)
                .blendMode(.hardLight) // poe o conteudo meio opaco ou invisivel (modo de mistura)
                .animation(.easeInOut(duration: 0.5)) // dá a animacao
            
            
            BackCardView()
                .frame(width: 340, height: 220) // a dimensao da stack principal (VStack)
                .background(show ? Color("card4") : Color("card3")) // cor do fundo
                .cornerRadius(20) // bordas
                .shadow(radius: 20) //sombra
                .offset(x: 0, y: show ? -150 : -20) // move na horizontal(x) ou na vertical(y) (verifica se o show for true ele nao faz o efeito)
                .offset(x: viewState.width, y: viewState.height) // quando começar a arrasta o viewsatate vai receber os valores e atualizar
                .offset(y: showCard ? -140 : 0) // da o efeito quando o menu aparece ele sobe
                .scaleEffect(showCard ? 1 :0.95) // da um efeito tipo escala (escalonado tipo escadas)
                .rotationEffect(.degrees(show ? 0 : 5)) // da efeito de rotacao (verifica se o show for true ele nao faz o efeito)
                .rotationEffect(.degrees(showCard ? -5 : 0)) // da o efeito quando o menu aparece ele fica alinhado
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0)) // da efeito de rotacao 3d e defimos em que eixo queremos esse efeito (x,y,z)
                .blendMode(.hardLight) // poe o conteudo meio opaco ou invisivel (modo de mistura)
                .animation(.easeInOut(duration: 0.3)) // dá a animacao
            
            
            CardView()
                .frame(width: showCard ? 370 : 340, height: 200) // a dimensao da stack principal (VStack)
                .background(Color.black) // cor do fundo
                //.cornerRadius(20) // bordas
                .shadow(radius: 20) //sombra
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous)) // bordas personalidas(da apple)
                .offset(x: viewState.width, y: viewState.height) // quando começar a arrasta o viewsatate vai receber os valores e atualizar
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight) // poe o conteudo meio opaco ou invisivel (modo de mistura)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) // response quando menor for o valor mais real sera a animacao, dampingFraction quanto maior o numero menos bounce
                .onTapGesture {
                    // self.show.toggle() // como show é uma valor booleano o toggle faz o controlo quando é true e false
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture()
                    //quando começa a arrastar
                    .onChanged { value in
                        self.viewState = value.translation //recebe os valores de translação
                        self.show = true
                }
                    //quando termina de arrastar
                    .onEnded { value in
                        self.viewState = .zero // volta para a posicao incial
                        self.show = false
                }
            )
            
            
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000) // move na horizontal(x) ou na vertical(y)
                .blur(radius: show ? 20 : 0)  // efeito blur (quanto menor o valor menos desfocado será)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)) // dá a animacao
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// foi criado uma subview ou componet (Extraxt Subview)
struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {  // alinhamento da stack (leading, trailing, center), o conteudo dentro da stack se fica na esquerda, ou direita, ou no centralizado
                    Text("iOS Engineer Card")
                        .font(.title) // fonte
                        .fontWeight(.semibold) // tipo de fonte (bold, semibold, italic)
                        .foregroundColor(.white) // cor do texto
                    Text("Brian Michael")
                        .foregroundColor(.white) // cor do texto
                }
                Spacer() // poe o maximo de espaço que ocupa todo comprimento
                Image("Logo1") // imagem
            }
                // .padding() // espaço para todos os lados
                .padding(.horizontal, 20) // espaço apenas no lado esquerdo e direito (HStack)
                .padding(.top, 20) // espaço apenas para cima (Hstack)
            Spacer()
            Image("Card1")
                .resizable() // adpta a imagem para qualquer dimensao dada
                .aspectRatio(contentMode: .fill) // proporção da imagem se é fit ou fill
                .frame(width: 300, height: 110, alignment: .top) // dimensao para a imagem
        }
    }
}



//outra subview ou component que são os outros cartões
struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}




//outra subview ou component que contem o TITULO E A IMAGEM
struct TitleSubView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Cartões") // texto
                    .font(.largeTitle) // fonte
                    .fontWeight(.bold) // tipo de fonte
                Spacer() // da o espaco maximo na horizontal pk está em uma HStack
            }
                .padding()  // espaco nos quadro lados
            Image("Background1") // imagem
            Spacer() // este espaço é dado na vertical para ocupar a altura toda do dispositivo
        }
    }
}




//outra subview ou component que é o menu que está por baixo
struct BottomCardView: View {
    var body: some View {
        
        VStack(spacing: 20) {  // dá um espaço na VStack
            
            
            Rectangle() // cria um rectangulo
                .frame(width: 40, height: 5) // dimensoes do rectangulo
                .cornerRadius(3) // bordas
                .opacity(0.1) // opacidade
            
            
            Text("Do not be anxious about tomorrow, for tomorrow will be anxious for itself. Let the day's own trouble be sufficient for the day.") // texto
                .font(.subheadline) // fonte
                .fontWeight(.medium) // tipo de fonte
                .multilineTextAlignment(.center) // alinhamento do texto (centro, esquerda, direita)
                .lineSpacing(4) // espaço entre o texto
            
            Spacer()  // este espaço é dado na vertical
        }
            .padding(.top, 8) // espaço para cima
            .padding(.horizontal, 20) // espaço horizontal
            .frame(maxWidth: .infinity) // da o maximo de comprimeto
            .background(Color.white) // cor do fundo
            .cornerRadius(30) // bordas
            .shadow(radius: 20) // sombra
    }
}
