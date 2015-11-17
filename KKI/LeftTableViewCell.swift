//
//  LeftTableViewCell.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/14/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

protocol LeftTableViewCellDelegate : NSObjectProtocol {
    func buyButtonHit()
    
}

class LeftTableViewCell: UITableViewCell {
    @IBOutlet weak var leftImage: UIImageView!

    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var stars: UILabel!
    
    @IBOutlet weak var topSellers: UILabel!
    
    var delegate:LeftTableViewCellDelegate?
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
