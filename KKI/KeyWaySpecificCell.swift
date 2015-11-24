//
//  KeyWaySpecificCell.swift
//  Kustom Key
//
//  Created by Richard Hayden on 11/2/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import CoreGraphics

class KeyWaySpecificCell: UITableViewCell {

    @IBOutlet weak var qtyTextField: UITextField!
    @IBOutlet weak var specificLabel: UILabel!
    @IBOutlet weak var specificCell: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }

}
