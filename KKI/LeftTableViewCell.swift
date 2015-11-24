//
//  LeftTableViewCell.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/14/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

protocol LeftTableViewCellDelegate : NSObjectProtocol {
    //func buyButtonHit()
}

class LeftTableViewCell: UITableViewCell {
    @IBOutlet weak var leftImage: UIImageView!

    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var stars: UILabel!
    
    @IBOutlet weak var topSellers: UILabel!
    
    //var delegate:LeftTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.leftImage!.image = nil
//    }
//
//    
//    func configureLeftCell(item:CatalogData) {
//        self.leftLabel.text = "\(item.title!)"
//        self.topSellers.hidden = item.decoration!
//        self.stars.hidden = item.decoration!
//        
//        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
//            var data: NSData?
//            
//            let url = NSURL(string:item.imageURL!)
//            data = NSData(contentsOfURL:url!)
//            dispatch_async(dispatch_get_main_queue()) {
//                if data != nil {
//                    //self.leftImage!.hnk_setImageFromURL(url!)
//                    self.leftImage!.image = UIImage(data:data!)
//                }
//            }
//        }
//    }
}
