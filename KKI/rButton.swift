//
//  rButton.swift
//  KKI
//
//  Created by Richard Hayden on 8/31/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

class rButton: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        RButtonStyleKit.drawRButton()
    }
    

}
