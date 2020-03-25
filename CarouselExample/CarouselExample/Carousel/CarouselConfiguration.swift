//
//  CarouselConfiguration.swift
//  CarouselExample
//
//  Created by Kumar, Sumit on 25/03/20.
//  Copyright © 2020 sk. All rights reserved.
//

import Foundation
import UIKit

///Protocol for CarouselFlowLayout Configuration.
///Types adopting to `CarouselConfiguration` protocol can be used to configure the offset, spacing, zoom and other attributes.
public protocol CarouselConfiguration {
    
    /// Defines the minimum spacing between the carousel cell items , Default is set to `18`
    var minLineSpacing: CGFloat {get set}
    
    /// Defines the offset length to be show in the view on side , Default is set to `18`
    var cellOffset: CGFloat {get set}
    
    /// Defines the zoom level for carousel zoom up effect when cell comes at center , Default is set to `1`
    /// Range : `0.1 - 1.0` , At 1 zoom effect will be minimum, keep lowering this to view more zoom effect
    var zoomLevel: CGFloat {get set}
    
    ///Defines how fast each item not in focus will reach the minimum scale factor , Default is set to `200`
    var minScalingOffset: CGFloat {get set}
}
