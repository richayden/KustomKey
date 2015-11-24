//
//  TextInputTableViewCell.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/31/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

class TextInputTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTextField: UITextField!
    
    internal func configure(text: String?, placeholder: String) {
        cellTextField.text = text
        cellTextField.placeholder = placeholder
        
        cellTextField.accessibilityValue = text
        cellTextField.accessibilityLabel = placeholder
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
