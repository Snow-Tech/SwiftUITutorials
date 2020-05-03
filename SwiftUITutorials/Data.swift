//
//  Data.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 5/3/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI

// struct e request api

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}


class Api {
    
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }  .resume()
    }
    
    
}
