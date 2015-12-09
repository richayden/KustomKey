//
//  extensions.swift
//  KKI
//
//  Created by Richard Hayden on 8/21/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func pb_takeSnapshot() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(172, 159), true, 0.0)
        
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        drawViewHierarchyInRect(CGRectMake((bounds.size.width - 172) / -2, -59, bounds.size.width, bounds.size.height), afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}