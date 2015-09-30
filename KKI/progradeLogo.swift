//
//  progradeLogo.swift
//  Kustom Key
//
//  Created by Richard Hayden on 9/5/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

class progradeLogo: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        ProgradeStyleKit.drawPrograde()
    }
    

}
