//
//  Images+CoreDataProperties.swift
//  
//
//  Created by Richard Hayden on 11/22/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Images {

    @NSManaged var image: NSData?
    @NSManaged var index: NSNumber?

}
