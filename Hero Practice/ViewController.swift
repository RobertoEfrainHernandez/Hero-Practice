//
//  ViewController.swift
//  Hero Practice
//
//  Created by Roberto Hernandez on 4/23/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flowerCollectionView: UICollectionView!
    var flowers = Flower.flowers
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currentCell = sender as? FlowerCell,
            let vc = segue.destination as? ViewController2 {
            vc.flower = currentCell.flower
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "FlowerCell", for: indexPath) as? FlowerCell)!
        cell.flower = flowers[indexPath.item]
        
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height / CGFloat(flowers.count))
    }
    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells as! Array<FlowerCell> {
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
                
                let translationX = cellFrame.origin.x / 5
                cell.flowerImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
                
            }
        }
    }
    func animateCell(cellFrame: CGRect) -> CATransform3D {
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax : CGFloat = 1.0
        let scaleMin : CGFloat = 0.6
        
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }
}

