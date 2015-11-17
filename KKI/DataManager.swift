//
//  DataManager.swift
//  Kustom Key
//
//  Created by Richard Hayden on 11/15/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import Foundation

class DataManager : NSObject {
    
    var items:[CatalogData]?
    
    class var sharedInstance: DataManager {
        struct Singleton {
            static let instance = DataManager()
        }
        return Singleton.instance
    }
    
    func getItemCount() -> Int {
        var count:Int = 0
        if let items_ = items {
            count = items_.count
        }
        return count
    }
    
    func getItemAtIndex(index:Int) -> CatalogData? {
        var item:CatalogData?
        if let items_ = items {
            item = items_[index]
        }
        return item
    }
    
}