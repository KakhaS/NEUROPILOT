//
//  DemoCollectionViewCell.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 14.10.21.
//

import UIKit
struct viewCell {
    var photos: UIImage
    var borderWith: Int
}

var collectionViewCells: [viewCell] = [
    viewCell(photos: UIImage(named: "firstCell")!, borderWith: 0),
viewCell(photos: UIImage(named: "secondCell")!, borderWith: 0),
viewCell(photos: UIImage(named: "thirdCell")!, borderWith: 0)
]

class DemoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    func setup(with viewCell: viewCell) {
        imageView.image = viewCell.photos
        imageView.layer.borderWidth = CGFloat(viewCell.borderWith)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    

}
