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
            .padding(.top, 30)
            
            Spacer() // este spacer como esta dentro de verticl stack então o espaço é na vertical para ele puder estar no topo
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
