//
//  CatalogVC.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/14/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import PKHUD
import CoreData
@IBDesignable
class CatalogVC: UITableViewController, RightTableViewCellDelegate, LeftTableViewCellDelegate {

    var json_data_url = "http://richayden.com/JSON/catalogdata.json"
    var image_base_url = "http://richayden.com/JSON/"
    var TableData:Array< datastruct > = Array < datastruct >()
    
    enum ErrorHandler:ErrorType {
        case ErrorFetchingResults
    }
    
    struct datastruct {
        var title:String?
        var heightOfCell:Int?
        var imageurl:String?
        var decoration:Bool?
        var image:UIImage? = nil
        
        init(add: NSDictionary) {
            imageurl = add["url"] as? String
            title = add["title"] as? String
            heightOfCell = add["heightOfCell"] as? Int
            decoration = add["decoration"] as? Bool
        }
    }

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        get_data_from_url(json_data_url)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("do_table_refresh"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        self.title = "Pocket Locksmith"
    }
    
    override func viewWillAppear(animated: Bool) {
        self.do_table_refresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CustomTableViewCellDelegate
    /*
    func buyButtonHit() {
        
        print("buy")
    }
    */

    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(TableData.count)
        return TableData.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            performSegueWithIdentifier("neuterBowSegue", sender: nil)
        }
        if indexPath.row == 1 {
            performSegueWithIdentifier("j3Segue", sender: nil)
        }
        if indexPath.row == 2 {
            performSegueWithIdentifier("largeBowSegue", sender: nil)
        }
        if indexPath.row == 5 {
            performSegueWithIdentifier("5762segue", sender: nil)
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let data = TableData[indexPath.row]
        tableView.rowHeight = CGFloat(data.heightOfCell!)
        return tableView.rowHeight
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 9 || indexPath.row == 10 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("leftCellID", forIndexPath: indexPath) as! LeftTableViewCell
            let data = TableData[indexPath.row]
            cell.leftLabel!.text = data.title
            cell.stars.hidden = data.decoration!
            cell.topSellers.hidden = data.decoration!
            if (data.image == nil) {
                cell.leftImage!.image = UIImage(named:"splashK")
                load_image(image_base_url + data.imageurl!, imageview: cell.leftImage!, index: indexPath.row)
            } else {
                cell.leftImage!.image = TableData[indexPath.row].image
            }
            return cell
        } else if indexPath.row == 1 || indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("rightCellID", forIndexPath: indexPath) as! RightTableViewCell
            let data = TableData[indexPath.row]
            cell.rightLabel!.text = data.title
            if (data.image == nil) {
                cell.rightImage!.image = UIImage(named:"splashK")
                load_image(image_base_url + data.imageurl!, imageview: cell.rightImage!, index: indexPath.row)
            } else {
                cell.rightImage!.image = TableData[indexPath.row].image
            }
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("logoCellID", forIndexPath: indexPath) as! LogoTableViewCell
            let data = TableData[indexPath.row]
            if (data.image == nil) {
                print("Nothing to add")
                return cell
            } else {
                print("What was Added?")
                return cell
            }
        }
        return cell
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       // segue.destinationViewController.
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    //}
    
    func get_data_from_url(url:String) {
        
        let url:NSURL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        let task = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            let json = NSString(data: data!, encoding: NSASCIIStringEncoding)
            self.extract_json(json!)
        }
        task.resume()
    }
    
    func extract_json(data:NSString) {
        
        var parseError: NSError?
        let jsonData:NSData = data.dataUsingEncoding(NSASCIIStringEncoding)!
        let json: AnyObject?
        do {
            json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
        } catch let error as NSError {
            parseError = error
            json = nil
        }
        if (parseError == nil) {
            
            if let list = json as? NSArray {
                for (var i = 0; i < list.count; i++ ) {
                    if let data_block = list[i] as? NSDictionary {
                        TableData.append(datastruct(add: data_block))
                    }
                }
                do {
                    try read()
                    do_table_refresh()
                }
                catch {
                }
            }
        }
    }
    
    func do_table_refresh() {
        dispatch_async(dispatch_get_main_queue(), {
            self.refreshControl?.endRefreshing()
            self.tableview.reloadData()
            PKHUD.sharedHUD.contentView = PKHUDProgressView()
            PKHUD.sharedHUD.show()
            PKHUD.sharedHUD.dimsBackground = true
            PKHUD.sharedHUD.hide(afterDelay: 0.25)
            return
        })
    }
    
    func load_image(urlString:String, imageview:UIImageView, index:NSInteger) {
        let url:NSURL = NSURL(string: urlString)!
        let session = NSURLSession.sharedSession()
        let task = session.downloadTaskWithURL(url) {
            (let location, let response, let error) in
            guard let _:NSURL = location, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
            let imageData = NSData(contentsOfURL: location!)
            dispatch_async(dispatch_get_main_queue(), {
                self.TableData[index].image = UIImage(data: imageData!)
                self.save(index,image: self.TableData[index].image!)
                imageview.image = self.TableData[index].image
                return
            })
            }
        }
        task.resume()
    }
    
    func read() throws {
        do {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest(entityName: "Images")
            let fetchedResults = try managedContext!.executeFetchRequest(fetchRequest)
            for (var i=0; i < fetchedResults.count; i++) {
                let single_result = fetchedResults[i]
                let index = single_result.valueForKey("index") as! NSInteger
                let img: NSData? = single_result.valueForKey("image") as? NSData
                TableData[index].image = UIImage(data: img!)
                print(single_result)
            }
        } catch {
            print("error")
            throw ErrorHandler.ErrorFetchingResults
        }
    }
    
    func save(id:Int,image:UIImage) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Images", inManagedObjectContext: managedContext!)
        let options = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        let newImageData = UIImagePNGRepresentation(image)
        options.setValue(id, forKey: "index")
        options.setValue(newImageData, forKey: "image")
        do {
            try managedContext!.save()
        } catch {
            print("error")
        }
    }
}