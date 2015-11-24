//
//  RightTableViewCell.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/16/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

protocol RightTableViewCellDelegate : NSObjectProtocol {
    //func buyButtonHit()
}

class RightTableViewCell: UITableViewCell {

    @IBOutlet weak var rightBuyButton: UIButton!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    
    //var delegate:RightTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.rightImage!.image = nil
//    }
//
//    func configureRightCell(item:CatalogData) {
//        self.rightLabel.text = "\(item.title!)"
//        
//        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
//            var data: NSData?
//            
//            let url = NSURL(string:item.imageURL!)
//            data = NSData(contentsOfURL:url!)
//            dispatch_async(dispatch_get_main_queue()) {
//                if data != nil {
//                    //self.rightImage!.hnk_setImageFromURL(url!)
//                    self.rightImage!.image = UIImage(data:data!)
//                    
////                    let cache = Shared.JSONCache
////                    let URL = NSURL(string: "https://api.github.com/users/haneke")!
////                    
////                    cache.fetch(URL: URL).onSuccess { JSON in
////                        print(JSON.dictionary?["bio"])
////                    }
//                }
//            }
//        }
//    }

}
