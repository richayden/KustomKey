//
//  Styles.swift
//  KKI
//
//  Created by Richard Hayden on 8/26/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
//@IBDesignable
var wireView: Bool = false
var brassView: Bool = false
var nickelView: Bool = false

var keyType = 4
var brassType = 4
var nickelType = 4

class Styles: UIView {

    override func drawRect(rect: CGRect) {
        
        if keyType == 1 && wireView == true {
            KeyStyleKit.drawStyle1W()
        }
        if keyType == 2 && wireView == true {
            KeyStyleKit.drawStyle2W()
        }
        if keyType == 3 && wireView == true {
            KeyStyleKit.drawStyle4W()
        }
        if keyType == 4 && wireView == true {
            KeyStyleKit.drawStyle5W()
        }
        if keyType == 5 && wireView == true {
            KeyStyleKit.drawStyle6W()
        }
        if keyType == 6 && wireView == true {
            KeyStyleKit.drawStyle8W()
        }
        if keyType == 7 && wireView == true {
            KeyStyleKit.drawStyleEW()
        }
        
        if brassType == 1 && brassView == true {
            KeyStyleKit.drawStyle1B()
        }
        if brassType == 2 && brassView == true {
            KeyStyleKit.drawStyle2B()
        }
        if brassType == 3 && brassView == true {
            KeyStyleKit.drawStyle4B()
        }
        if brassType == 4 && brassView == true {
            KeyStyleKit.drawStyle5B()
        }
        if brassType == 5 && brassView == true {
            KeyStyleKit.drawStyle6B()
        }
        if brassType == 6 && brassView == true {
            KeyStyleKit.drawStyle8B()
        }
        if brassType == 7 && brassView == true {
            KeyStyleKit.drawStyleEB()
        }
        
        if nickelType == 1 && nickelView == true {
            KeyStyleKit.drawStyle1N()
        }
        if nickelType == 2 && nickelView == true {
            KeyStyleKit.drawStyle2N()
        }
        if nickelType == 3 && nickelView == true {
            KeyStyleKit.drawStyle4N()
        }
        if nickelType == 4 && nickelView == true {
            KeyStyleKit.drawStyle5N()
        }
        if nickelType == 5 && nickelView == true {
            KeyStyleKit.drawStyle6N()
        }
        if nickelType == 6 && nickelView == true {
            KeyStyleKit.drawStyle8N()
        }
        if nickelType == 7 && nickelView == true {
            KeyStyleKit.drawStyleEN()
        }
        
        //self.setNeedsDisplay()
        
    }
}
