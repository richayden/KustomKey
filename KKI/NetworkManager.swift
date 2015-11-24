//
//  NetworkManager.swift
//  Kustom Key
//
//  Created by Richard Hayden on 11/15/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

@objc protocol NetworkManagerDelegate : NSObjectProtocol {
    func loadComplete()
    optional func loadFailed()
}

class NetworkManager: NSObject {
    
    var delegate:NetworkManagerDelegate?
    
    func loadItems() -> Void {
        
        Alamofire.request(.GET, "http://richayden.com/JSON/catalogdata.json", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                //print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                var items = Array<CatalogData>()
                
                if let JSON = response.result.value {
                    let num = JSON["number"] as! Int
                    let str = JSON["string"] as! String
                    
                    let catalog_data = JSON["table_data"] as! Array<AnyObject>
                    print("number: \(num)")
                    print("string: \(str)")
                    for item in catalog_data {
                        let title = item["title"] as! String
                        let url = item["url"] as! String
                        let heightOfCell = item["heightOfCell"] as! Int
                        let decoration = item["decoration"] as! Bool
                        let item = CatalogData()
                        item.title = title
                        item.heightOfCell = heightOfCell
                        item.imageURL = url
                        item.decoration = decoration
                        items.append(item)
                    }
                }
                
                // Apply item array to the data manager
                DataManager.sharedInstance.items = items
                if let delegate_ = self.delegate {
                    delegate_.loadComplete()
                }
        }
    }
}