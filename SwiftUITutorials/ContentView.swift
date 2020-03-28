//
//  ContentView.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/28/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width: 300, height: 220) // a dimensao da stack principal (VStack)
            .background(Color.blue) // cor do fundo
            .cornerRadius(20) // bordas
            .shadow(radius: 20) //sombra
            .offset(x: 0, y: -20) // move na horizontal(x) ou na vertical(y)
            
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
                .frame(width: 340, height: 200) // a dimensao da stack principal (VStack)
                .background(Color.black) // cor do fundo
                .cornerRadius(20) // bordas
                .shadow(radius: 20) //sombra
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
