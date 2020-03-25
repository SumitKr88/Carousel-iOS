//
//  CarouselNonAnimatedFlowLayout.swift
//  CarouselExample
//
//  Created by Kumar, Sumit on 25/03/20.
//  Copyright © 2020 sk. All rights reserved.
//

import Foundation
import UIKit

class CarouselNonAnimatedFlowLayout: CarouselFlowLayout {
    
    override func prepare() {
        super.prepare()
    }
    
    /// Define the scrolling behaviour for carousel layout
    /// - Parameter proposedContentOffset: This is the value at which scrolling would stop.
    /// - Parameter velocity: The current scrolling velocity
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView, !collectionView.isPagingEnabled,
            let layoutAttributes = self.layoutAttributesForElements(in: collectionView.bounds)
            else {
                return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        }
        
        let contentOffsetOrigin = proposedContentOffset.x + collectionView.bounds.size.width/2
        
        var targetContentOffset: CGPoint
        let contentOffset = layoutAttributes.sorted { abs($0.center.x - contentOffsetOrigin) < abs($1.center.x - contentOffsetOrigin) }.first ?? UICollectionViewLayoutAttributes()
        targetContentOffset = CGPoint(x: floor(contentOffset.center.x - collectionView.bounds.size.width/2), y: proposedContentOffset.y)
        return targetContentOffset
    }
}
