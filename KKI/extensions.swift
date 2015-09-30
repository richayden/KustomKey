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
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(170, 170), true, 0.0)
        
        drawViewHierarchyInRect(CGRectMake((bounds.size.width - 170) / -2, -112, bounds.size.width, bounds.size.height), afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
}


//Documents/

// PDF context
/*
@available(iOS 3.2, *)
public func UIGraphicsBeginPDFContextToFile(path: String, _ bounds: CGRect, _ documentInfo: [NSObject : AnyObject]?) -> Bool

@available(iOS 3.2, *)
public func UIGraphicsBeginPDFContextToData(data: NSMutableData, _ bounds: CGRect, _ documentInfo: [NSObject : AnyObject]?)

@available(iOS 3.2, *)
public func UIGraphicsEndPDFContext()

@available(iOS 3.2, *)
public func UIGraphicsBeginPDFPage()

@available(iOS 3.2, *)
public func UIGraphicsBeginPDFPageWithInfo(bounds: CGRect, _ pageInfo: [NSObject : AnyObject]?)

@available(iOS 3.2, *)
public func UIGraphicsGetPDFContextBounds() -> CGRect

@available(iOS 3.2, *)
public func UIGraphicsSetPDFContextURLForRect(url: NSURL, _ rect: CGRect)

@available(iOS 3.2, *)
public func UIGraphicsAddPDFContextDestinationAtPoint(name: String, _ point: CGPoint)

@available(iOS 3.2, *)
public func UIGraphicsSetPDFContextDestinationForRect(name: String, _ rect: CGRect)
*/
