//
//  ViewController.swift
//  KKI
//
//  Created by Richard Hayden on 8/13/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import CoreGraphics


@IBDesignable


class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet weak var lineOneLabel: UILabel!
    @IBOutlet weak var lineTwoLabel: UILabel!
    @IBOutlet weak var lineThreeLabel: UILabel!
    
    @IBOutlet weak var lineOneTextField: UITextField!
    @IBOutlet weak var lineTwoTextField: UITextField!
    @IBOutlet weak var lineThreeTextField: UITextField!
    
    @IBOutlet weak var RButton: UIButton!
    @IBOutlet weak var LButton: UIButton!
    
   
    @IBOutlet weak var previewButton: UIButton!
    @IBOutlet weak var nickelButton: UIButton!
    @IBOutlet weak var brassButton: UIButton!
    
    @IBOutlet weak var orderButton: UIButton!
    
    @IBOutlet weak var startOverButton: UIButton!
    
    @IBOutlet weak var keyView: Styles!
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    // Defining user defaults and line one key
    let myDefaults = NSUserDefaults.standardUserDefaults()
    let lineOneTextSavedKey = "lineOneText"
    
    
    let renderedTextColor = UIColor(red: 132/255, green: 112/255, blue: 12/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // View did load checks and loads line one key's value
        let myDefaults = NSUserDefaults.standardUserDefaults()
        if let lineOne = myDefaults.stringForKey(lineOneTextSavedKey)
        {
            lineOneLabel.text = lineOne
            lineOneLabel.hidden = false
            lineOneTextField.hidden = true
        }

        
        
        wireView = true
        self.lineOneTextField.delegate = self
        self.lineTwoTextField.delegate = self
        self.lineThreeTextField.delegate = self
        
        brassButton.backgroundColor = UIColor(red: 216/255, green: 182/255, blue: 82/255, alpha: 1.0)
        brassButton.layer.cornerRadius = 15
        brassButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        brassButton.layer.borderWidth = 1.5
        brassButton.layer.borderColor = UIColor.yellowColor().CGColor
        brassButton.layer.shadowOffset = CGSizeMake(3, 3)
        brassButton.layer.shadowColor = UIColor.blackColor().CGColor
        brassButton.layer.shadowOpacity = 1.0
        
        nickelButton.backgroundColor = UIColor(red: 200/255, green: 201/255, blue: 167/255, alpha: 0.4)
        nickelButton.layer.cornerRadius = 15
        
        nickelButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        nickelButton.layer.borderWidth = 0.0
        nickelButton.layer.shadowOffset = CGSizeMake(3, 3)
        nickelButton.layer.shadowColor = UIColor.blackColor().CGColor
        nickelButton.layer.shadowOpacity = 0.0
        
        
    }
    // This function limits the number of characters allowed in textfields
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool
    {
        let maxLength = 12
        let currentString: NSString = textField.text!
        let newString: NSString =
        currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
    }
    // This allows return key on keyboard to enter text in textfield and close keyboard
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == self.lineOneTextField {
            
            if lineOneTextField.text!.isEmpty {
                
                let alert = UIAlertController(title: "Oops!", message: "Please Enter Text in the Box", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
               
                lineOneLabel.text = lineOneTextField.text
                lineOneLabel.textAlignment = NSTextAlignment.Center

                lineOneLabel.hidden = false
                lineOneLabel.text = lineOneTextField.text
                // Text for line one is saved to user defaults
                myDefaults.setObject(lineOneTextField.text, forKey: lineOneTextSavedKey)
                lineOneTextField.hidden = true
                lineTwoTextField.hidden = false
                lineTwoTextField.enablesReturnKeyAutomatically = false
                lineOneTextField.resignFirstResponder()
                self.lineTwoTextField.becomeFirstResponder()
                
                }
            }
        
        if textField == self.lineTwoTextField {
        
            if lineTwoTextField.text!.isEmpty {
                
                let alert = UIAlertController(title: "Oops!", message: "Please Enter Text in the Box", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                
                lineTwoLabel.hidden = false
                lineTwoLabel.text = lineTwoTextField.text
                lineTwoTextField.hidden = true
                lineThreeTextField.hidden = false
                lineThreeTextField.enablesReturnKeyAutomatically = false
                lineTwoTextField.resignFirstResponder()
                self.lineThreeTextField.becomeFirstResponder()
                }
            }
        
        if textField == self.lineThreeTextField {
            
            if lineThreeTextField.text!.isEmpty {
                
                let alert = UIAlertController(title: "Oops!", message: "Please Enter Text in the Box", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                lineThreeLabel.hidden = false
                lineThreeLabel.text = lineThreeTextField.text
                lineThreeTextField.hidden = true
                previewButton.hidden = false
                RButton.hidden = false
                LButton.hidden = false
                lineThreeTextField.resignFirstResponder()
            }
        }
            return true
    }
    
    func style1FontSetup() {
        lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 177)
        lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
        
        lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 221)
        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
        
        lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 242)
        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
    }
    
    func style2FontSetup() {
        lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 185)
        lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
        
        lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 214)
        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 21)
        
        lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 241)
        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)

    }
    
    func style4FontSetup() {
        lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 180)
        lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
        
        lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 211)
        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 21)
        
        lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
    }
    
    func style5FontSetup () {
        lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 177)
        lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
        
        lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 204)
        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
        
        lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 231)
        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
    }
    
    func style6FontSetup() {
        lineOneLabel.center = CGPoint(x: (self.view.bounds.width / 2) + 18, y: 181)
        lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 24)
        
        lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 203)
        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 18)
        
        lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 241)
        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)

    }
    
    func style8FontSetup() {
        lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 178)
        lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 24)
        
        lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 202)
        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 18)
        
        lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 228)
        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
    }
    
    func styleEFontSetup() {
        lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 177)
        lineOneLabel.font = UIFont(name: "AvenirLTStd-Black", size: 24)
        
        lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 201)
        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Black", size: 24)
        
        lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 225)
        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Black", size: 24)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    @IBAction func orderSelectionButtonPressed(sender: UIButton) {
        
        //self.view.backgroundColor = UIColor.whiteColor()
        
        let screenshot = self.view?.pb_takeSnapshot()
        
        //UIImagePNGRepresentation(screenshot!)
        
        //UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
        var documentsDirectory:String?
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if paths.count > 0 {
            documentsDirectory = paths[0] as? String
            
            let savePath = documentsDirectory! + "/keydie.png"
            NSFileManager.defaultManager().createFileAtPath(savePath, contents: UIImagePNGRepresentation(screenshot!), attributes: nil)
        }
        
//        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as? String
//        
//        var getImagePath = paths.stringByAppendingPathComponent("SavedFile.jpg")
//        
//        var checkValidation = NSFileManager.defaultManager()
//        
//        if (checkValidation.fileExistsAtPath(getImagePath))
//        {
//            println("FILE AVAILABLE");
//        }
//        else
//        {
//            println("FILE NOT AVAILABLE");
//        }
        
}
    
    @IBAction func clearButtonPressed(sender: AnyObject) {
        
        myDefaults.setObject(nil, forKey: lineOneTextSavedKey)
        keyType == 4
        self.view.viewWithTag(5)!.setNeedsDisplay()
        lineOneLabel.hidden = true
        lineOneTextField.hidden = false
        
        
    }
    @IBAction func nextStyleButtonPressed(sender: UIButton) {
        
        if keyType == 7 {
            keyType = 1
            self.view.viewWithTag(5)!.setNeedsDisplay()
        } else {
            keyType++
        print(keyType)
            
            self.view.viewWithTag(5)!.setNeedsDisplay()
            
        }
        
        if brassType == 7 {
            brassType = 1
            self.view.viewWithTag(5)!.setNeedsDisplay()
        } else {
            brassType++
            print(brassType)
            
            self.view.viewWithTag(5)!.setNeedsDisplay()
            
        }
        
        if nickelType == 7 {
            nickelType = 1
            self.view.viewWithTag(5)!.setNeedsDisplay()
        } else {
            nickelType++
            print(nickelType)
            
            self.view.viewWithTag(5)!.setNeedsDisplay()
            
        }

        
        
        if keyType == 1 {
            
            style1FontSetup()
            
        }
        else {
        
        if keyType == 2 {
            
            style2FontSetup()
            
        }
        else {
            
        
        if keyType == 3 {
            style4FontSetup()
            
        }
        else {
        
        if keyType == 4 {
            style5FontSetup()
            
        }
        else {
        
        if keyType == 5 {
            
            style6FontSetup()
            
        }
        else {
        
        if keyType == 6 {
            
            style8FontSetup()
            
        }
        else {
        
        if keyType == 7 {
            
            styleEFontSetup()
            
        }
    }
    }
    }
    }
    }
    }
        if brassView == true {
            
            brassType = keyType
            
            lineOneLabel.textColor = renderedTextColor
            lineTwoLabel.textColor = renderedTextColor
            lineThreeLabel.textColor = renderedTextColor
            
            lineOneLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
            lineTwoLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
            lineThreeLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
        
        if brassType == 1 {
            
            style1FontSetup()
        }
        else {
            
            if brassType == 2 {
                
                style2FontSetup()
            }
            else {
                
                
                if brassType == 3 {
                    
                    style4FontSetup()
                }
                else {
                    
                    if brassType == 4 {
                        
                        style5FontSetup()
                        
                    }
                    else {
                        
                        if brassType == 5 {
                            
                            style6FontSetup()
                            
                        }
                        else {
                            
                            if brassType == 6 {
                                
                                style8FontSetup()
                            }
                            else {
                                
                                if brassType == 7 {
                                    
                                    styleEFontSetup()
                                    
                                        
                                        lineOneLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                        lineTwoLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                        lineThreeLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                        
                                        lineOneLabel.shadowColor = renderedTextColor
                                        lineTwoLabel.shadowColor = renderedTextColor
                                        lineThreeLabel.shadowColor = renderedTextColor
                                    }
                                    else {
                                        
                                        lineOneLabel.textColor = renderedTextColor
                                        lineTwoLabel.textColor = renderedTextColor
                                        lineThreeLabel.textColor = renderedTextColor
                                        
                                        lineOneLabel.shadowColor = UIColor.yellowColor()
                                        lineTwoLabel.shadowColor = UIColor.yellowColor()
                                        lineThreeLabel.shadowColor = UIColor.yellowColor()
                                    

                                }
                            }
                        }
                    }
                }
            }
        }
        }

        
        
    }
    
    
//******************************************NOT THIS******************
    @IBAction func backStyleButtonPressed(sender: UIButton) {
        
        if keyType == 1 {
            keyType = 7
            self.view.viewWithTag(5)!.setNeedsDisplay()
        } else {
            keyType--
            print(keyType)
            
            self.view.viewWithTag(5)!.setNeedsDisplay()
            
        }
        
        if brassType == 1 {
            brassType = 7
            self.view.viewWithTag(5)!.setNeedsDisplay()
        } else {
            brassType--
            print(brassType)
            
            self.view.viewWithTag(5)!.setNeedsDisplay()
            
        }
        
        if nickelType == 1 {
            nickelType = 7
            self.view.viewWithTag(5)!.setNeedsDisplay()
        } else {
            nickelType--
            print(nickelType)
            
            self.view.viewWithTag(5)!.setNeedsDisplay()
            
        }
        
        
        
        if keyType == 1 {
            
            style1FontSetup()
            
        }
        else {
            
            if keyType == 2 {
                
                style2FontSetup()
                
            }
            else {
                
                
                if keyType == 3 {
                    style4FontSetup()
                    
                }
                else {
                    
                    if keyType == 4 {
                        style5FontSetup()
                        
                    }
                    else {
                        
                        if keyType == 5 {
                            
                            style6FontSetup()
                            
                        }
                        else {
                            
                            if keyType == 6 {
                                
                                style8FontSetup()
                                
                            }
                            else {
                                
                                if keyType == 7 {
                                    
                                    styleEFontSetup()
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        if brassView == true {
            
            brassType = keyType
            
            lineOneLabel.textColor = renderedTextColor
            lineTwoLabel.textColor = renderedTextColor
            lineThreeLabel.textColor = renderedTextColor
            
            lineOneLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
            lineTwoLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
            lineThreeLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
            
            if brassType == 1 {
                
                style1FontSetup()
            }
            else {
                
                if brassType == 2 {
                    
                    style2FontSetup()
                }
                else {
                    
                    
                    if brassType == 3 {
                        
                        style4FontSetup()
                    }
                    else {
                        
                        if brassType == 4 {
                            
                            style5FontSetup()
                            
                        }
                        else {
                            
                            if brassType == 5 {
                                
                                style6FontSetup()
                                
                            }
                            else {
                                
                                if brassType == 6 {
                                    
                                    style8FontSetup()
                                }
                                else {
                                    
                                    if brassType == 7 {
                                        
                                        styleEFontSetup()
                                        
                                        
                                        lineOneLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                        lineTwoLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                        lineThreeLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                        
                                        lineOneLabel.shadowColor = renderedTextColor
                                        lineTwoLabel.shadowColor = renderedTextColor
                                        lineThreeLabel.shadowColor = renderedTextColor
                                    }
                                    else {
                                        
                                        lineOneLabel.textColor = renderedTextColor
                                        lineTwoLabel.textColor = renderedTextColor
                                        lineThreeLabel.textColor = renderedTextColor
                                        
                                        lineOneLabel.shadowColor = UIColor.yellowColor()
                                        lineTwoLabel.shadowColor = UIColor.yellowColor()
                                        lineThreeLabel.shadowColor = UIColor.yellowColor()
                                        
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            if nickelView == true {
                
                nickelType = keyType
                
                lineOneLabel.textColor = renderedTextColor
                lineTwoLabel.textColor = renderedTextColor
                lineThreeLabel.textColor = renderedTextColor
                
                lineOneLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                lineTwoLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                lineThreeLabel.shadowColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                
                if nickelType == 1 {
                    
                    style1FontSetup()
                }
                else {
                    
                    if nickelType == 2 {
                        
                        style2FontSetup()
                    }
                    else {
                        
                        
                        if nickelType == 3 {
                            
                            style4FontSetup()
                        }
                        else {
                            
                            if nickelType == 4 {
                                
                                style5FontSetup()
                                
                            }
                            else {
                                
                                if nickelType == 5 {
                                    
                                    style6FontSetup()
                                    
                                }
                                else {
                                    
                                    if nickelType == 6 {
                                        
                                        style8FontSetup()
                                    }
                                    else {
                                        
                                        if nickelType == 7 {
                                            
                                            styleEFontSetup()
                                            
                                            
                                            lineOneLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                            lineTwoLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                            lineThreeLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                                            
                                            lineOneLabel.shadowColor = renderedTextColor
                                            lineTwoLabel.shadowColor = renderedTextColor
                                            lineThreeLabel.shadowColor = renderedTextColor
                                        }
                                        else {
                                            
                                            lineOneLabel.textColor = renderedTextColor
                                            lineTwoLabel.textColor = renderedTextColor
                                            lineThreeLabel.textColor = renderedTextColor
                                            
                                            lineOneLabel.shadowColor = UIColor.yellowColor()
                                            lineTwoLabel.shadowColor = UIColor.yellowColor()
                                            lineThreeLabel.shadowColor = UIColor.yellowColor()
                                            
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                
        }
        }
    }

    @IBAction func previewModeButtonPressed(sender: UIButton) {
        
        brassButton.hidden = false
        nickelButton.hidden = false
        
        if previewButton.currentTitle == "Preview Mode" {
            self.view.viewWithTag(5)!.setNeedsDisplay()
            
            brassView = true
            
            
            //brassType = keyType
            if brassType == 7 {
                
                lineOneLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                lineTwoLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                lineThreeLabel.textColor = UIColor(red: 247/255, green: 230/255, blue: 41/255, alpha: 1.0)
                
                lineOneLabel.shadowColor = renderedTextColor
                lineTwoLabel.shadowColor = renderedTextColor
                lineThreeLabel.shadowColor = renderedTextColor
            }
            else {
                
                
                
                lineOneLabel.textColor = renderedTextColor
                lineTwoLabel.textColor = renderedTextColor
                lineThreeLabel.textColor = renderedTextColor
                
                lineOneLabel.shadowColor = UIColor.yellowColor()
                lineTwoLabel.shadowColor = UIColor.yellowColor()
                lineThreeLabel.shadowColor = UIColor.yellowColor()
            }
            
            //renderButton.hidden = true
            //orderButton.hidden = false
            //startOverButton.hidden = false
            
            previewButton.setTitle("Basic Mode", forState: UIControlState.Normal)
            
        }
        else {
            
            if previewButton.currentTitle == "Basic Mode" {
                wireView = true
                brassView = false
                nickelView = false
                //keyType = brassType
                brassButton.hidden = true
                nickelButton.hidden = true
                
                self.view.viewWithTag(5)!.setNeedsDisplay()
                //brassView = false
                
                
                
                lineOneLabel.textColor = UIColor.blackColor()
                lineTwoLabel.textColor = UIColor.blackColor()
                lineThreeLabel.textColor = UIColor.blackColor()
                
                lineOneLabel.shadowColor = nil
                lineTwoLabel.shadowColor = nil
                lineThreeLabel.shadowColor = nil
                
                previewButton.setTitle("Preview Mode", forState: UIControlState.Normal)
                
            }
            
        }
        
    }
    
    @IBAction func brassButtonPressed(sender: UIButton) {
        
        self.view.viewWithTag(5)!.setNeedsDisplay()
        nickelView = false
        brassView = true
        brassType = nickelType
        
        brassButton.backgroundColor = UIColor(red: 216/255, green: 182/255, blue: 82/255, alpha: 1.0)
        brassButton.layer.cornerRadius = 15
        brassButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        brassButton.layer.borderWidth = 1.5
        brassButton.layer.borderColor = UIColor.yellowColor().CGColor
        brassButton.layer.shadowOffset = CGSizeMake(3, 3)
        brassButton.layer.shadowColor = UIColor.blackColor().CGColor
        brassButton.layer.shadowOpacity = 1.0
        
        nickelButton.backgroundColor = UIColor(red: 200/255, green: 201/255, blue: 167/255, alpha: 0.4)
        nickelButton.layer.cornerRadius = 15
        
        nickelButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        nickelButton.layer.borderWidth = 0.0
        nickelButton.layer.shadowOffset = CGSizeMake(3, 3)
        nickelButton.layer.shadowColor = UIColor.blackColor().CGColor
        nickelButton.layer.shadowOpacity = 0.0
    }
    @IBAction func nickelButtonPressed(sender: UIButton) {
        
        self.view.viewWithTag(5)!.setNeedsDisplay()
        brassView = false
        nickelView = true
        nickelType = brassType
        
        brassButton.backgroundColor = UIColor(red: 216/255, green: 182/255, blue: 82/255, alpha: 0.4)
        brassButton.layer.cornerRadius = 15
        brassButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        brassButton.layer.borderWidth = 0.0
        brassButton.layer.shadowOffset = CGSizeMake(3, 3)
        brassButton.layer.shadowColor = UIColor.blackColor().CGColor
        brassButton.layer.shadowOpacity = 0.0
        
        nickelButton.backgroundColor = UIColor(red: 200/255, green: 201/255, blue: 167/255, alpha: 1.0)
        nickelButton.layer.cornerRadius = 15
        nickelButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        
        
        nickelButton.layer.borderWidth = 1.5
        nickelButton.layer.borderColor = UIColor(red: 242/255, green: 234/255, blue: 212/255, alpha: 1.0).CGColor
        nickelButton.layer.shadowOffset = CGSizeMake(3, 3)
        nickelButton.layer.shadowColor = UIColor.blackColor().CGColor
        nickelButton.layer.shadowOpacity = 1.0
        
        
        
    }

}