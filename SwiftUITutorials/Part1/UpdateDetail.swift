//
//  UpdateDetail.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 3/31/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI


// Datelhe da cell


struct UpdateDetail: View {
    
    var update: Update = updateData[0]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
