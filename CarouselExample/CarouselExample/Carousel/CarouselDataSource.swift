//
//  CarouselDataSource.swift
//  CarouselExample
//
//  Created by Kumar, Sumit on 25/03/20.
//  Copyright © 2020 sk. All rights reserved.
//

import Foundation
import UIKit

/// Carousel view data source
class CarouselDataSource<T>: NSObject, UICollectionViewDataSource {
    
    // MARK: - Custom Data Type
    typealias CollectionCellConfig = (T, UICollectionViewCell) -> Void
    
    // MARK: - Private Properties
    
    private var model: [T]
    private var reuseIdentifier: String
    private var collectionCellConfig: CollectionCellConfig
    
    // MARK: - Initializer
    
    init(model: [T], reuseIdentifier: String, collectionCellConfig: @escaping CollectionCellConfig) {
        self.model = model
        self.reuseIdentifier = reuseIdentifier
        self.collectionCellConfig = collectionCellConfig
    }

    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath)
        let modelItem = model[indexPath.item]
        collectionCellConfig(modelItem, cell)
        return cell
    }
}
