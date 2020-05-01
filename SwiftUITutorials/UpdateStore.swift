//
//  UpdateStore.swift
//  SwiftUITutorials
//
//  Created by Brian Hashirama on 5/1/20.
//  Copyright © 2020 PROIT-CONSULTING. All rights reserved.
//

import SwiftUI
import Combine


// implementando combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData // variavel que está constantemente atualizando usamos o Published
}

