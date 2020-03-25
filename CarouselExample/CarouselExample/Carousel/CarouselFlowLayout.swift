//
//  CarouselFlowLayout.swift
//  CarouselExample
//
//  Created by Kumar, Sumit on 25/03/20.
//  Copyright © 2020 sk. All rights reserved.
//

import Foundation
import UIKit

/// This class defines the custom flow layout content by subclassing the UICollectionViewFlowLayout
class CarouselFlowLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    
    /// Defaults for all the configuations required to setup the carousel flow layout.
    private var minimumSpacing: CGFloat = 18.0
    private var offset: CGFloat = 18.0
    private var zoomFactor: CGFloat = 1.0
    private var scalingOffset: CGFloat = 200
    
    private var bounds: CGRect {
        return collectionView?.bounds ?? .zero
    }
    
    // MARK: - Functions
    
    /// Initial computations includes setting the itemSize and insets for FlowLayout
    override func prepare() {
        
        minimumLineSpacing = minimumSpacing
        
        // Set scrollDirection and paging
        scrollDirection = .horizontal
        collectionView?.isPagingEnabled = false
        
        let width: CGFloat = bounds.width - 2 * minimumSpacing - 2 * offset
        itemSize = CGSize(width: width, height: bounds.height)
        
        let left = (bounds.width - width) / 2
        sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: left)
    }
    
    /// Function to configure the collection view layout attributes
    /// - Parameter attributes: collection view layout attributes
    func configureAttributes(for attributes: UICollectionViewLayoutAttributes) {
        guard let collection = collectionView else { return }
        let contentOffset = collection.contentOffset
        let size = collection.bounds.size
        
        // Zooom the cells as they reach the center of the screen
        let visibleRect = CGRect(x: contentOffset.x, y: contentOffset.y, width: size.width, height: size.height)
        let visibleCenterX = visibleRect.midX
        
        let distanceFromCenter = visibleCenterX - attributes.center.x
        let absDistanceFromCenter = min(abs(distanceFromCenter), scalingOffset)
        let scale = absDistanceFromCenter * (zoomFactor - 1) / scalingOffset + 1
        
        //All the elements that are smaller are not in focus, therefore they should have a smaller zIndex so that if
        //they will overlap accordingly to the perspective in case of a negative value for the *minimumLineSpacing*
        //property.
        attributes.zIndex = Int(scale * 100000)
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
}

/// Extension of `CarouselFlowLayout` conforming to `CarouselConfiguration`.
/// Includes The dynamic Implemenations for all the passcode configurations
extension CarouselFlowLayout: CarouselConfiguration {
    
    public var minLineSpacing: CGFloat {
        get {
            return minimumSpacing
        }
        set {
            minimumSpacing =  newValue
        }
    }
    
    public var cellOffset: CGFloat {
        get {
            return offset
        }
        set {
            offset =  newValue
        }
    }
    
    public var zoomLevel: CGFloat {
        get {
            return zoomFactor
        }
        set {
            zoomFactor =  newValue
        }
    }
    
    public var minScalingOffset: CGFloat {
        get {
            return scalingOffset
        }
        set {
            scalingOffset =  newValue
        }
    }
}
