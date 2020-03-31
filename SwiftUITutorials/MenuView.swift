//
//  MenuView.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/30/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        VStack {
            Spacer() // ocupa o espaço todo na vertical
            
            //Cartão de opções
            VStack(spacing: 16) {
                Text("Brian Michael - iOS Engineer") // texto
                    .font(.caption)
                
                
                // Color como é uma view então tem as mesmas propriedades que as outras
                Color.white
                    .frame(width: 38, height: 6) // tamanho da view
                    .cornerRadius(3) // bordas
                    .frame(width: 130, height: 6, alignment: .leading) // tamanho da view e alinhamento
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08)) //cor de fundo e opacidade
                    .cornerRadius(3)// bordas
                    .padding() //espaço de todos os lados
                    .frame(width: 150, height: 24) // tamanho da view
                    .background(Color.black.opacity(0.1)) //cor de fundo e opacidade
                    .cornerRadius(12) // bordas
                
                MenuRow(title: "Meu Perfil", imageIcon: "person")
                MenuRow(title: "Definições", imageIcon: "gear")
                MenuRow(title: "Sair", imageIcon: "arrowshape.turn.up.left")
            }
                .frame(maxWidth: .infinity) // comprimeto da view
                .frame(height: 300) // altura da view
                //.background(Color.white) // cor de fundo
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom)) // fundo com gradiente
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous)) // bordas redondas
                //.shadow(radius: 30) // sombreamento
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20) // customizar o sombreamento
                .padding(.horizontal, 20) // espaço na horizontal(esquerda e direita)
                .overlay(
                    Image("Brian") // foto
                        .resizable() // redimensiona
                        .aspectRatio(contentMode: .fill) //content mode
                        .frame(width: 60, height: 60) // tamanha da foto
                        .clipShape(Circle()) // foto circular
                        .offset(y: -150) // posicao na vertical
            )
        }
            .padding(.bottom, 30) // espaço apenas para baixo
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}



//Content
struct MenuRow: View {
    
    var title: String
    var imageIcon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: imageIcon)
                .font(.system(size: 20, weight: .medium, design: .default)) // formato e aspecto da imagem
                .imageScale(.large) // escala da imagem
                .frame(width: 32, height: 32) // tamanho da imagem
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading) // tamanho do texto e alinhamento
        }
    }
}
