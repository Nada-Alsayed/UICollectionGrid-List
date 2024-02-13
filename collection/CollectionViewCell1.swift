//
//  CollectionViewCell1.swift
//  collection
//
//  Created by MAC on 12/02/2024.
//

import UIKit

class CollectionViewCell1: UICollectionViewCell {

    @IBOutlet weak var myImg: UIImageView!
    
    static var id = String(describing: CollectionViewCell1.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
