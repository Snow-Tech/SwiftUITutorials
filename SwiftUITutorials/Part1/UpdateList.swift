//
//  UpdateList.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/31/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

//Lista de items

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(title: "New Item", image: "Card1", text: "text", date: "Jan 1"))
    }
    
    var body: some View {
        
        //Navigation controller
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) { // quando clicas em uma das cells
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(update.text)
                                    .lineLimit(2) // restrição de numero de linhas
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                
                            }
                        }
                        .padding(.vertical)
                        
                    }
                }
                
                    // para puder deletar a cell
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                    
                    
                    // para puder mover a cell
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
                
                
                
            }
                .navigationBarTitle(Text("Cursos")) //large titles
                .navigationBarItems(leading: Button(action: addUpdate) { // adiciona um botao a esquerda
                    Text("Add Update")
                }, trailing: EditButton()) // adicionar um botao a direita
        }
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var text: String
    var date: String
}


let updateData =
    [
        Update(title: "SwiftUI", image: "Card1", text: "Melhor curso que pode haver!", date: "03/02/2020"),
        Update(title: "Swift 5", image: "Card2", text: "Melhor curso que pode haver!", date: "04/02/2020"),
        Update(title: "Node.JS", image: "Card3", text: "Melhor curso que pode haver!", date: "10/02/2020"),
        Update(title: "Spring", image: "Card4", text: "Melhor curso que pode haver!", date: "03/05/2020"),
        Update(title: "DB", image: "Card5", text: "Melhor curso que pode haver!", date: "03/06/2020")
        
]
