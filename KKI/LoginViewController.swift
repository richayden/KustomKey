//
//  LoginViewController.swift
//  KKI
//
//  Created by Richard Hayden on 8/23/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginWebView: UIWebView!
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let url = NSURL(string: "https://checkout.netsuite.com/s.nl?c=317655&sc=1&reset=T&login=T&reset=T&login=T&redirect_count=1&did_javascript_redirect=T")!
        
        //loginWebView.loadRequest(NSURLRequest(URL: url))
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.loginWebView.loadHTMLString(String(webContent!), baseURL: nil)
                })
                
                
                
            } else {
                
            }

            }
        task.resume()
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
