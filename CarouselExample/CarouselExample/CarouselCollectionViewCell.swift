//
//  CarouselCollectionViewCell.swift
//  CarouselExample
//
//  Created by Kumar, Sumit on 25/03/20.
//  Copyright © 2020 sk. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Custom methods
    /// Method to populate the secondary view with the recommendation detail
    /// - Parameter recommendation: Recommendation object
    func populate(item: Item) {
        textLabel.text = "Item: " + item.value
    }
}
