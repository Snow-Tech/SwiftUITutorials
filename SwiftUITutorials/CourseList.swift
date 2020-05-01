//
//  CourseList.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 5/1/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    

    @State var courses = courseData
    @State var active = false
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(active ? 0.5 : 0)
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            
            
            ScrollView {
                VStack(spacing: 30) {
                    
                    Text("Criadores")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 20)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(show: self.$courses[index].show, course: self.courses[index], active: self.$active)
                                .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60 )
                        .zIndex(self.courses[index].show ? 1 : 0) // quando clica ele preenche o ecra e deixa o resto por trás, tenta comentar esta linha e ve a diferença
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            
            .statusBar(hidden: active ? true : false) // faz desparecer o status bar
                .animation(.linear)
        }
        
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}



struct CourseView: View {
    
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    
    var body: some View {
        
        // Conteudo do cartão
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30) {
                Text("When you don't create things, you become defined by your tastes rather than ability. your tastes only narrow & exclude people. so create.")
                
                Text("Frases de Programadores")
                    .font(.title).bold()
                
                Text("I think that it’s extraordinarily important that we in computer science keep fun in computing. When it started out it was an awful lot of fun. Of course the paying customers got shafted every now and then and after a while we began to take their complaints seriously. We began to feel as if we really were responsible for the successful error-free perfect use of these machines. I don’t think we are. I think we’re responsible for stretching them setting them off in new directions and keeping fun in the house. I hope the ﬁeld of computer science never loses its sense of fun. Above all I hope we don’t become missionaries. Don’t feel as if you’re Bible sales-men. The world has too many of those already. What you know about computing other people will learn. Don’t feel as if the key to successful computing is only in your hands. What’s in your hands I think and hope is intelligence: the ability to see the machine as more than when you were ﬁrst led up to it that you can make it more.")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280)
            .offset(y: show ? 380 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            
            
            VStack {
                // TEXTO
                HStack(alignment:.top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    
                    //LOGO
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                    
                    
                }
                
                //IMAGEM DO CARTÃO
                Spacer()
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:. infinity)
                    .frame(height: 140, alignment: .top)
            }
                
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30: 0)
                //.frame(width: show ? screen.width : screen.width - 60  , height: show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60  , maxHeight: show ? 460 : 280)
                .background(Color(course.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                .onTapGesture {
                    self.show.toggle()
                    self.active.toggle()
            }
        }
        .frame(height: show ? screen.height : 280)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}



struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
}


var courseData = [
        Course(title: "Steve Jobs", subtitle: "Apple", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), show: false),
        Course(title: "Bill Gates", subtitle: "Microsoft", image: #imageLiteral(resourceName: "Card5"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), show: false),
        Course(title: "Linus Torvalds", subtitle: "Linux", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), show: false),
        Course(title: "Brian Michael", subtitle: "Izanami", image: #imageLiteral(resourceName: "Card1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), show: false)


]
