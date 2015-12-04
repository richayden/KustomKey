//
//  J3.swift
//  Kustom Key
//
//  Created by Richard Hayden on 12/2/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

var j3BW: Bool = false
var j3B: Bool = false
var j3N: Bool = false

var j3keyType = 1
var j3brassType = 1
var j3nickelType = 1


class J3: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        if j3keyType == 1 && j3BW == true {
            KeyStyleKit.drawJ3PW()
        }
        if j3keyType == 2 && j3BW == true {
            KeyStyleKit.drawJ3EW()
        }
        if j3keyType == 3 && j3BW == true {
            KeyStyleKit.drawJ3DNDW()
        }
        
        if j3brassType == 1 && j3B == true {
            KeyStyleKit.drawJ3PB()
        }
        if j3brassType == 2 && j3B == true {
            KeyStyleKit.drawJ3EB()
        }
        if j3brassType == 3 && j3B == true {
            KeyStyleKit.drawJ3DNDB()
        }
        
        if j3nickelType == 1 && j3N == true {
            KeyStyleKit.drawJ3PN()
        }
        if j3nickelType == 2 && j3N == true {
            KeyStyleKit.drawJ3EN()
        }
        if j3nickelType == 3 && j3N == true {
            KeyStyleKit.drawJ3DNDN()
        }
        
        
        
        // Drawing code
    }
    

}
