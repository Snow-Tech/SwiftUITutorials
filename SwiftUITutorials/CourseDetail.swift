//
//  CourseDetail.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 5/3/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

struct CourseDetail: View {
    
    var course: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int

    
    var body: some View {
        
        
        ScrollView {
            VStack {
                //CARD
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
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
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
                
                
                
                //DETAIL
                VStack(alignment: .leading, spacing: 30) {
                    Text("When you don't create things, you become defined by your tastes rather than ability. your tastes only narrow & exclude people. so create.")
                    
                    Text("Frases de Programadores")
                        .font(.title).bold()
                    
                    Text("I think that it’s extraordinarily important that we in computer science keep fun in computing. When it started out it was an awful lot of fun. Of course the paying customers got shafted every now and then and after a while we began to take their complaints seriously. We began to feel as if we really were responsible for the successful error-free perfect use of these machines. I don’t think we are. I think we’re responsible for stretching them setting them off in new directions and keeping fun in the house. I hope the ﬁeld of computer science never loses its sense of fun. Above all I hope we don’t become missionaries. Don’t feel as if you’re Bible sales-men. The world has too many of those already. What you know about computing other people will learn. Don’t feel as if the key to successful computing is only in your hands. What’s in your hands I think and hope is intelligence: the ability to see the machine as more than when you were ﬁrst led up to it that you can make it more.")
                }
                .padding(30)
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: courseData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
