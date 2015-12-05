//
//  J3VC.swift
//  Kustom Key
//
//  Created by Richard Hayden on 12/2/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import CoreGraphics

class J3VC: UIViewController, UITabBarControllerDelegate {
    

    @IBOutlet weak var j3View: J3!
    
    var swipeKeyStyle: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "J3 Mid Bow"
        
        j3brassType = 1
        j3B = true
        swipeKeyStyle = true
        self.view.viewWithTag(2)!.setNeedsDisplay()
        print(j3keyType, j3BW, swipeKeyStyle)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftSwipe(sender: UISwipeGestureRecognizer) {
        if swipeKeyStyle == true {
            if j3keyType == 3 || j3brassType == 3 || j3nickelType == 3 {
                j3keyType = 1; j3brassType = 1; j3nickelType = 1
            } else {
                j3keyType++; j3brassType++; j3nickelType++
            }
            self.view.viewWithTag(2)!.setNeedsDisplay()
            print(j3keyType)
        }
    }
    
    @IBAction func rightSwipe(sender: UISwipeGestureRecognizer) {
        if swipeKeyStyle == true {
            if j3keyType == 1 || j3brassType == 1 || j3nickelType == 1 {
                j3keyType = 3; j3brassType = 3; j3nickelType = 3
            } else {
                j3keyType--; j3brassType--; j3nickelType--
            }
            self.view.viewWithTag(2)!.setNeedsDisplay()
            print(j3keyType)
        }
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
