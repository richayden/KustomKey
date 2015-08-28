//
//  Styles.swift
//  KKI
//
//  Created by Richard Hayden on 8/26/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
//@IBDesignable

var keyType: Int = 4

class Styles: UIView {
    
    

    override func drawRect(rect: CGRect) {
        
        if keyType == 1 {
            KeyStyleKit.drawStyle1W()
        }
        if keyType == 2 {
            KeyStyleKit.drawStyle2W()
        }
        if keyType == 3 {
            KeyStyleKit.drawStyle4W()
        }
        if keyType == 4 {
            KeyStyleKit.drawStyle5W()
        }
        if keyType == 5 {
            KeyStyleKit.drawStyle6W()
        }
        if keyType == 6 {
            KeyStyleKit.drawStyle8W()
        }
        if keyType == 7 {
            KeyStyleKit.drawStyleEW()
        }
        
        self.setNeedsDisplay()
        

        
    }
//    override func prepareForInterfaceBuilder() {
//        //keyType = 1
//        
//
//    }

    

}

//var iconType: String? = nil
//
//override func drawRect(rect: CGRect) {
//    if iconType == "email" {
//        StyleKit.drawEmail(frame: rect, color: tintColor)
//    }
//    
//    if iconType = "email-read" {
//        StyleKit.drawEmailRead(frame: rect, color: tintColor)
//    }
//    
//    // if none of the above, draw nothing
//}
//
//// draw the 'email' icon by default in Interface Builder
//override func prepareForInterfaceBuilder() {
//    iconType = "email"
//}
