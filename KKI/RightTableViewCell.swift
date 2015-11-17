//
//  RightTableViewCell.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/16/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

protocol RightTableViewCellDelegate : NSObjectProtocol {
    func buyButtonHit()
    
}

class RightTableViewCell: UITableViewCell {

    @IBOutlet weak var rightBuyButton: UIButton!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    
    var delegate:RightTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
