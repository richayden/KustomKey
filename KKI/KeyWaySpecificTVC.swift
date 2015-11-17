//
//  KeyWaySpecificTVC.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/23/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import CoreGraphics

class KeyWaySpecificTVC: UITableViewController, UITextFieldDelegate {
    
    let brassColor = UIColor(red: 199/255, green: 176/255, blue: 107/255, alpha: 1.0)
    let nickelColor = UIColor(red: 198/255, green: 198/255, blue: 177/255, alpha: 1.0)
    var checkedRows=Set<NSIndexPath>()
    let keyWayPartNumber = KeyWaySpecificData()
    let keyWaySpecificIdentifier = "keyWaySpecificID"
    
    @IBOutlet var specificTableView: UITableView!
    var heading = ""
    var parts = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parts = keyWayPartNumber.keyWay(heading)
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func endEditingNow(){
        self.view.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        let keyboardDoneButtonView = UIToolbar()
        keyboardDoneButtonView.sizeToFit()
        
        // Setup the buttons to be put in the system.
        let item = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.Done, target: self, action: Selector("endEditingNow") )
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let toolbarButtons = [flexibleSpace, item]
        
        //Put the buttons into the ToolBar and display the tool bar
        keyboardDoneButtonView.setItems(toolbarButtons, animated: false)
        textField.inputAccessoryView = keyboardDoneButtonView
        textField.keyboardType = .NumberPad
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parts.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        if selectedIndexPaths.containsObject(indexPath) {
            // deselect
            selectedIndexPaths.removeObject(indexPath)
        }
        else {
            // select
            selectedIndexPaths.addObject(indexPath)
        }
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! KeyWaySpecificCell
        configure(cell, forRowAtIndexPath: indexPath)
        
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> KeyWaySpecificCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("keyWaySpecificID", forIndexPath: indexPath) as! KeyWaySpecificCell
        
        // Configure the cell...
        cell.selectionStyle = .None
        configure(cell, forRowAtIndexPath: indexPath)
        //print(cell.specificLabel.text)
        return cell
    }
    var selectedIndexPaths = NSMutableSet()
    
    func configure(cell: KeyWaySpecificCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.specificLabel?.text = parts[indexPath.row]
        cell.specificLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 15.0)
        cell.backgroundColor = UIColor.clearColor()
        if selectedIndexPaths.containsObject(indexPath) {
            // selected
            tableView.rowHeight = 150
            cell.qtyTextField.hidden = false
            cell.backgroundColor = KeyStyleKit.nickelLight
            print(cell.specificLabel.text)
        }
        else {
            // not selected
            tableView.rowHeight = 43
            cell.qtyTextField.hidden = true
            cell.backgroundColor = UIColor.clearColor()
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
        
        let itemToMove:String = parts[fromIndexPath.row]
        parts.removeAtIndex(fromIndexPath.row)
        parts.insert(itemToMove, atIndex: toIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
        
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.None
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
