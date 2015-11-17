//
//  KeyWaysTVC.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/23/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

let defaults = NSUserDefaults.standardUserDefaults()
let path = NSBundle.mainBundle().pathForResource("KeyWayData", ofType: "plist")
let dict = NSMutableDictionary(contentsOfFile: path!)
let mfKey:NSString = "Manufacturer"
let keyWayCellIdentifier = "keyWayCellID"
var keyWayData = [String]() //Was NSString

class KeyWaysTVC: UITableViewController {
        
    @IBOutlet var keyWayTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Keyway" //Sets page title
        
        if defaults.objectForKey("prefs") != nil {
            
            keyWayData = defaults.objectForKey("prefs") as! [String] //Was NSString
            
        } else {
            
            keyWayData = dict!.objectForKey(mfKey) as! [String] //Was NSString
            //print(dict)
            
        }
     
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return keyWayData.count
//        print(DSM.getMFList()!.count)
//        return DSM.getMFList()!.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("keyWayCellID", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = keyWayData[indexPath.row] as String
        cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18.0)
        
        //print(cell.textLabel?.text)

        return cell
    }
    
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
//        UIView.animateWithDuration(0.25, animations: {
//            cell.layer.transform = CATransform3DMakeScale(1,1,1)
//        })
//    }
    
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let itemToMove:String = keyWayData[fromIndexPath.row] as String
        keyWayData.removeAtIndex(fromIndexPath.row)
        keyWayData.insert(itemToMove, atIndex: toIndexPath.row)
        defaults.setObject(keyWayData, forKey: "prefs")
        //print(defaults)
        
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.None
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "keyWaySegueID"{
            let vc = segue.destinationViewController as! KeyWaySpecificTVC
            let selectedManufacturer = keyWayData[(tableView.indexPathForSelectedRow?.row)!]
            vc.heading = selectedManufacturer as String
            vc.navigationItem.title = selectedManufacturer as String
            defaults.setObject(keyWayData, forKey: "prefs")
            
        }
    }
    

}
