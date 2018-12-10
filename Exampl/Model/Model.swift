//
//  Model.swift
//  Exampl
//
//  Created by Admin on 19/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Model {
    var image: Data?
    var like: Bool
    var index: Int
    
    init(image: Data? = nil, like: Bool, index: Int) {
        self.image = image
        self.like = like
        self.index = index
    }
}

