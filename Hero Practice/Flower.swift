//
//  Flower.swift
//  Hero Practice
//
//  Created by Roberto Hernandez on 4/23/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit

struct Flower {
    var name: String
    var image : UIImage
    
    static var flowers = [
        Flower(name: "Flower 1", image: #imageLiteral(resourceName: "flower-1")),
        Flower(name: "Flower 2", image: #imageLiteral(resourceName: "flower-2")),
        Flower(name: "Flower 3", image: #imageLiteral(resourceName: "flower-3")),
        Flower(name: "Flower 4", image: #imageLiteral(resourceName: "flower-4")),
        Flower(name: "Flower 5", image: #imageLiteral(resourceName: "flower-5"))
    ]
}
