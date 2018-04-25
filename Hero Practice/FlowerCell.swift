//
//  FlowerCell.swift
//  Hero Practice
//
//  Created by Roberto Hernandez on 4/23/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit
import Hero

class FlowerCell: UICollectionViewCell {
    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var flowerLabel: UILabel!
    
    var flower : Flower? {
        didSet {
            guard let flower = flower else { return }
            let name = flower.name
            
            flowerLabel.text = name
            flowerLabel.hero.id = "\(name)_name"
            flowerLabel.hero.modifiers = [.zPosition(4)]
            flowerImageView.image = flower.image
            flowerImageView.hero.id = "\(name)_image"
            flowerImageView.hero.modifiers = [.zPosition(2)]
        }
    }
}
