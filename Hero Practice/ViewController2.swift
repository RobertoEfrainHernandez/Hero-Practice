//
//  ViewController2.swift
//  Hero Practice
//
//  Created by Roberto Hernandez on 4/23/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var flowerLabel: UILabel!
    
    var flower : Flower?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let flower = flower {
            let name = flower.name
            
            flowerLabel.text = name
            flowerLabel.hero.id = "\(name)_name"
            flowerImageView.image = flower.image
            flowerImageView.hero.id = "\(name)_image"
        }
    }

}
