//
//  ViewController2.swift
//  Hero Practice
//
//  Created by Roberto Hernandez on 4/23/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit
import Hero

class ViewController2: UIViewController {

    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var flowerLabel: UILabel!
    
    var flower : Flower?
    var panGR : UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        panGR = UIPanGestureRecognizer(target: self, action: #selector(handlePan(gestureRecognizer:)))
        view.addGestureRecognizer(panGR)
        
        if let flower = flower {
            let name = flower.name
            
            flowerLabel.text = name
            flowerLabel.hero.id = "\(name)_name"
            flowerLabel.hero.modifiers = [.zPosition(4)]
            flowerImageView.image = flower.image
            flowerImageView.hero.id = "\(name)_image"
            flowerImageView.hero.modifiers = [.zPosition(2)]
        }
    }
    
    @objc func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        let translation = panGR.translation(in: nil)
        let progress = translation.y / 2 / view.bounds.height
        
        switch panGR.state {
        case .began:
            /* Begin Transition */
            dismiss(animated: true, completion: nil)
        case .changed:
            /* Calulate progree based on user's movement */
            let imagePosition = CGPoint(x: flowerImageView.center.x, y: translation.y + flowerImageView.center.y)
            let namePosition = CGPoint(x: flowerLabel.center.x, y: translation.y + flowerLabel.center.y)
            
            Hero.shared.apply(modifiers: [.position(imagePosition)], to: flowerImageView)
            Hero.shared.apply(modifiers: [.position(namePosition)], to: flowerLabel)
        default:
            /* End the transition */
            if progress + panGR.velocity(in: nil).y / view.bounds.height > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }

}
