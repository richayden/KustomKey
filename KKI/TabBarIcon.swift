//
//  TabBarIcon.swift
//  Kustom Key
//
//  Created by Richard Hayden on 11/13/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

class TabBarIcon: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        KeyStyleKit.imageOfTinyK
        KeyStyleKit.drawTinyK()
        KeyStyleKit.drawNeuterIcon()
        KeyStyleKit.imageOfNeuterIcon
        KeyStyleKit.drawNavBarGradient()
        KeyStyleKit.imageOfNavBarGradient
    }
    

}
