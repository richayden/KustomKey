//
//  DesignerVC.swift
//  Kustom Key
//
//  Created by Richard Hayden on 11/8/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import CoreGraphics

class DesignerVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lineOneLabel: UILabel!
    @IBOutlet weak var lineTwoLabel: UILabel!
    @IBOutlet weak var lineThreeLabel: UILabel!
    @IBOutlet weak var lineOneTextField: UITextField!
    @IBOutlet weak var lineTwoTextField: UITextField!
    @IBOutlet weak var lineThreeTextField: UITextField!
    @IBOutlet weak var materialSelector: UISegmentedControl!
    @IBOutlet weak var previewMode: UIButton!
    @IBOutlet weak var keyView: Styles!
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var textOneConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textTwoConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textThreeConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lineOneConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lineTwoConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lineThreeConstraint: NSLayoutConstraint!
    
    let brassColor = UIColor(red: 199/255, green: 176/255, blue: 107/255, alpha: 1.0)
    let darkBrass = UIColor(red: 76/255, green: 66/255, blue: 9/255, alpha: 1.0)
    
    let nickelColor = UIColor(red: 198/255, green: 198/255, blue: 177/255, alpha: 1.0)
    let darkNickel = UIColor(red: 89/255, green: 75/255, blue: 40/255, alpha: 1.0)
    
    let black = UIColor.blackColor()
    
    var swipeKeyStyle: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets view title
        self.title = "Designer"
        //Fixes Nav Bar Anomaly
        
        self.navigationController!.navigationBar.translucent = false
        
        self.lineOneTextField.delegate = self
        self.lineTwoTextField.delegate = self
        self.lineThreeTextField.delegate = self
        //Text fields fixed position
        textOneConstraint.constant = -84
        textTwoConstraint.constant = -112
        textThreeConstraint.constant = -138
        //Initial key value
        keyType = 4
        wireView = true

        self.view.viewWithTag(5)!.setNeedsDisplay()

        // Do any additional setup after loading the view.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool
    {
        let maxLength = 12
        let currentString: NSString = textField.text!
        let newString: NSString =
        currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
    }

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
                //lineOneLabel.textAlignment = NSTextAlignment.Center
                //lineOneConstraint.constant = -81
                
                lineOneLabel.hidden = false
                switchStyle()
                //lineOneLabel.text = lineOneTextField.text
                // Text for line one is saved to user defaults
                //myDefaults.setObject(lineOneTextField.text, forKey: lineOneTextSavedKey)
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
                //lineTwoConstraint.constant = -108
                
                lineTwoTextField.hidden = true
                lineThreeTextField.hidden = false
                switchStyle()
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
                //lineThreeConstraint.constant = -135
                
                lineThreeTextField.hidden = true
                switchStyle()
                //previewButton.hidden = false
                lineThreeTextField.resignFirstResponder()
                swipeKeyStyle = true
            }
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftSwipe(sender: UISwipeGestureRecognizer) {
        if swipeKeyStyle == true {
            if keyType == 7 || brassType == 7 || nickelType == 7 {
                keyType = 1; brassType = 1; nickelType = 1
            } else {
                keyType++; brassType++; nickelType++
            }
            self.view.viewWithTag(5)!.setNeedsDisplay()
            colorCheck()
            print(keyType)
        }
        switchStyle()
    }
    
    @IBAction func rightSwipe(sender: UISwipeGestureRecognizer) {
        if swipeKeyStyle == true {
            if keyType == 1 || brassType == 1 || nickelType == 1 {
                keyType = 7; brassType = 7; nickelType = 7
            } else {
                keyType--; brassType--; nickelType--
            }
            self.view.viewWithTag(5)!.setNeedsDisplay()
            colorCheck()
            print(keyType)
            print(colorCheck())
        }
        switchStyle()
    }

    @IBAction func materialChoicePressed(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            nickelView = false
            brassView = true
            wireView = false
            colorCheck()
            self.view.viewWithTag(5)!.setNeedsDisplay()
        case 1:
            nickelView = true
            brassView = false
            wireView = false
            colorCheck()
            self.view.viewWithTag(5)!.setNeedsDisplay()
        default:
            print("Is this thing on?")
        }
    }
    
    @IBAction func previewModePressed(sender: AnyObject) {
        
        if previewMode.currentTitle == "Preview Mode" {
            materialSelector.hidden = false
            materialSelector.selectedSegmentIndex = 0
            brassView = true
            nickelView = false
            wireView = false
            previewMode.setTitle("Basic Mode", forState: UIControlState.Normal)
            switchStyle()
            colorCheck()
            self.view.viewWithTag(5)!.setNeedsDisplay()
        } else {
            
        if previewMode.currentTitle == "Basic Mode" {
            
            materialSelector.hidden = true
            materialSelector.selectedSegmentIndex = 0
            brassView = false
            nickelView = false
            wireView = true
            previewMode.setTitle("Preview Mode", forState: UIControlState.Normal)
            switchStyle()
            colorCheck()
            self.view.viewWithTag(5)!.setNeedsDisplay()
            }
        }
    }
    
    func style1FontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            checkForStyle4()
            lineOneConstraint.constant = -78
            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 24)
            lineTwoConstraint.constant = -120
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            lineThreeConstraint.constant = -141
            lineThreeLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 22)
        }
    }
    
    func style2FontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            checkForStyle4()
            lineOneConstraint.constant = -84
            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 26)
            lineTwoConstraint.constant = -113
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 21)
            lineThreeConstraint.constant = -140
            lineThreeLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }
    }
    
    func style4FontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            checkForStyle4()
            lineOneConstraint.constant = -80
            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            lineTwoConstraint.constant = -100
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 18)
            lineThreeConstraint.constant = -140
            lineThreeLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }
    }
    
    func style5FontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            checkForStyle4()
            lineOneConstraint.constant = -81
            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
            lineTwoConstraint.constant = -108
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
            lineThreeConstraint.constant = -135
            lineThreeLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
        }
    }
    
    func style6FontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            checkForStyle4()
            lineOneConstraint.constant = -81
            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            lineTwoConstraint.constant = -101
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 19)
            lineThreeConstraint.constant = -140
            lineThreeLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 22)
        }
    }
    
    func style8FontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            checkForStyle4()
            lineOneConstraint.constant = -78
            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 24)
            lineTwoConstraint.constant = -100
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 19)
            lineThreeConstraint.constant = -127
            lineThreeLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }
    }
    
    func styleEFontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            checkForStyle4()
            lineOneConstraint.constant = -78
            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Black", size: 23)
            lineTwoConstraint.constant = -102
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Black", size: 22)
            lineThreeConstraint.constant = -130
            lineThreeLabel_.font = UIFont(name: "AvenirNextCondensed-Bold", size: 22)
        }
    }
    
    func switchStyle() {
        if keyType == 1 || brassType == 1 || nickelType == 1 {
            style1FontSetup()
        }
        if keyType == 2 || brassType == 2 || nickelType == 2 {
            style2FontSetup()
        }
        if keyType == 3 || brassType == 3 || nickelType == 3 {
            style4FontSetup()
        }
        if keyType == 4 || brassType == 4 || nickelType == 4 {
            style5FontSetup()
        }
        if keyType == 5 || brassType == 5 || nickelType == 5 {
            style6FontSetup()
        }
        if keyType == 6 || brassType == 6 || nickelType == 6 {
            style8FontSetup()
        }
        if keyType == 7 || brassType == 7 || nickelType == 7 {
            styleEFontSetup()
        }
        self.view.setNeedsDisplay()
    }
    
    func colorCheck() {
        if brassView == true && brassType == 7 {
            if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
                lineOneLabel_.textColor = brassColor
                lineTwoLabel_.textColor = brassColor
                lineThreeLabel_.textColor = brassColor
                lineOneLabel_.shadowColor = UIColor.yellowColor()
                lineTwoLabel_.shadowColor = UIColor.yellowColor()
                lineThreeLabel_.shadowColor = UIColor.yellowColor()
                lineOneLabel_.layer.shadowOpacity = 0.7
                lineTwoLabel_.layer.shadowOpacity = 0.7
                lineThreeLabel_.layer.shadowOpacity = 0.7
                lineOneLabel_.layer.shadowRadius = 1.5
                lineTwoLabel_.layer.shadowRadius = 1.5
                lineThreeLabel_.layer.shadowRadius = 1.5
                print("brass style emboss")
            }
        }
        if brassView == true && brassType != 7 {
            if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
                lineOneLabel_.textColor = darkBrass
                lineTwoLabel_.textColor = darkBrass
                lineThreeLabel_.textColor = darkBrass
                lineOneLabel_.layer.shadowOffset = CGSizeMake(0, 0)
                lineTwoLabel_.layer.shadowOffset = CGSizeMake(0, 0)
                lineThreeLabel_.layer.shadowOffset = CGSizeMake(0, 0)
                lineOneLabel_.shadowColor = UIColor.clearColor()
                lineTwoLabel_.shadowColor = UIColor.clearColor()
                lineThreeLabel_.shadowColor = UIColor.clearColor()
                lineOneLabel_.layer.shadowRadius = 0
                lineTwoLabel_.layer.shadowRadius = 0
                lineThreeLabel_.layer.shadowRadius = 0
                print("brass style incised")
            }
        }
        if nickelView == true && nickelType == 7 {
            if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
                lineOneLabel_.textColor = nickelColor
                lineTwoLabel_.textColor = nickelColor
                lineThreeLabel_.textColor = nickelColor
                lineOneLabel_.shadowColor = UIColor.whiteColor()
                lineTwoLabel_.shadowColor = UIColor.whiteColor()
                lineThreeLabel_.shadowColor = UIColor.whiteColor()
                lineOneLabel_.layer.shadowOpacity = 0.7
                lineTwoLabel_.layer.shadowOpacity = 0.7
                lineThreeLabel_.layer.shadowOpacity = 0.7
                lineOneLabel_.layer.shadowRadius = 1.5
                lineTwoLabel_.layer.shadowRadius = 1.5
                lineThreeLabel_.layer.shadowRadius = 1.5
                print("nickel style emboss")
            }
        }
        if nickelView == true && nickelType != 7 {
            if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
                lineOneLabel_.textColor = darkNickel
                lineTwoLabel_.textColor = darkNickel
                lineThreeLabel_.textColor = darkNickel
                lineOneLabel_.shadowColor = nil
                lineTwoLabel_.shadowColor = nil
                lineThreeLabel_.shadowColor = nil
                lineOneLabel_.layer.shadowRadius = 0
                lineTwoLabel_.layer.shadowRadius = 0
                lineThreeLabel_.layer.shadowRadius = 0
                print("nickel style incised")
            }
        }
        if wireView == true {
            if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
                lineOneLabel_.textColor = black
                lineTwoLabel_.textColor = black
                lineThreeLabel_.textColor = black
                lineOneLabel_.layer.shadowOffset = CGSizeMake(0, 0)
                lineTwoLabel_.layer.shadowOffset = CGSizeMake(0, 0)
                lineThreeLabel_.layer.shadowOffset = CGSizeMake(0, 0)
                lineOneLabel_.shadowColor = nil
                lineTwoLabel_.shadowColor = nil
                lineThreeLabel_.shadowColor = nil
                lineOneLabel_.layer.shadowRadius = 0
                lineTwoLabel_.layer.shadowRadius = 0
                lineThreeLabel_.layer.shadowRadius = 0
                print("black and white wire view")
            }
        }
    }
    
    func checkForStyle4() {
        if let lineThreeLabel_ = lineThreeLabel {
            if keyType == 3 || brassType == 3 || nickelType == 3 {
                lineThreeLabel_.hidden = true
            } else {
                lineThreeLabel_.hidden = false
            }
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
