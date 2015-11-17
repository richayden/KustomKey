//
//  Data.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/15/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import Foundation

class Data : NSObject {
    class Entry {
        let imageName: String
        let heading: String
        let isVisible: Bool
        let cellHeight: Int
        init (iName:String, heading: String, decoration: Bool, heightOfCell: Int) {
            self.heading = heading
            self.imageName = iName
            self.isVisible = decoration
            self.cellHeight = heightOfCell
        }
    }
    let tableItems = [
        Entry(iName: "neuterBow", heading: "Neuter Bow\n" + "Key Blanks", decoration: false, heightOfCell: 260),
        Entry(iName: "j3", heading: "J3 Mid Bow\n" + "Key Blanks", decoration: true, heightOfCell: 270),
        Entry(iName: "largeBow", heading: "Large Bow\n" + "Key Blanks", decoration: true, heightOfCell: 250),
        Entry(iName: "laKey", heading: "LaKey™\n" + "Key Blanks", decoration: true, heightOfCell: 250),
        Entry(iName: "", heading: "", decoration: true, heightOfCell: 100),
        Entry(iName: "5762antique", heading: "Model 5762\n" + "Lockset", decoration: true, heightOfCell: 290),
        Entry(iName: "5765", heading: "Model 5765\n" + "Lockset", decoration: true, heightOfCell: 310),
        Entry(iName: "d313", heading: "Model D313\n" + "Deadbolt", decoration: true, heightOfCell: 270),
        Entry(iName: "5851", heading: "Grade 2\n" + "5851 Lockset", decoration: true, heightOfCell: 270),
        Entry(iName: "58320", heading: "Grade 2\n" + "58320 Series", decoration: true, heightOfCell: 270),
        Entry(iName: "d605", heading: "Grade 2\n" + "D605 Deadbolt", decoration: true, heightOfCell: 300)
    ]
}

