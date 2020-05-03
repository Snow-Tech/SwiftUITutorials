//
//  DataStore.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 5/3/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI
import Combine


// pegando os dados com combine
class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    
    
    func getPosts(){
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
