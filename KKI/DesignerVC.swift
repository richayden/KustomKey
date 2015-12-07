//
//  DesignerVC.swift
//  Kustom Key
//
//  Created by Richard Hayden on 11/8/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import PKHUD
import CoreGraphics
//@IBDesignable
class DesignerVC: UIViewController, UITextFieldDelegate, UITabBarControllerDelegate {

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
    
    @IBOutlet weak var arcText: UIImageView!
    
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var clearButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var previewButton: UIBarButtonItem!
    @IBOutlet weak var selectButton: UIBarButtonItem!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let brassColor = UIColor(red: 199/255, green: 176/255, blue: 107/255, alpha: 1.0)
    let darkBrass = UIColor(red: 76/255, green: 66/255, blue: 9/255, alpha: 1.0)
    
    let nickelColor = UIColor(red: 198/255, green: 198/255, blue: 177/255, alpha: 1.0)
    let darkNickel = UIColor(red: 89/255, green: 75/255, blue: 40/255, alpha: 1.0)
    
    let appGreen = UIColor(red: 200/255, green: 201/255, blue: 167/255, alpha: 1.0)
    
    let black = UIColor.blackColor()
    
    var swipeKeyStyle: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Neuter Bow Designer"
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
        swipeKeyStyle = false
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
                //let undo: UILabel = undoManager?.prepareWithInvocationTarget(lineOneLabel) as! UILabel

                lineOneLabel.text = lineOneTextField.text
                //lineOneLabel.textAlignment = NSTextAlignment.Center
                //lineOneConstraint.constant = -81
                
                
                
                lineOneLabel.hidden = false
                style5FontSetup()
                //switchStyle()
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
                //switchStyle()
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
                //switchStyle()
                //previewButton.hidden = false
                lineThreeTextField.resignFirstResponder()
                swipeKeyStyle = true
                toolbar.hidden = false
                //descriptionLabel.text = "Incised Style 5"
            }
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewMoveInFromLeft(nextView:UIView!,aniTime:Float!,animoteKey:String!){
        let animation:CATransition = CATransition()
        animation.duration = CFTimeInterval(aniTime)
        animation.type = "moveIn"
        animation.timingFunction = CAMediaTimingFunction(name: "easeInEaseOut")
        animation.subtype = "fromLeft"
        animation.fillMode = "forwards"
        nextView.layer.addAnimation(animation, forKey: animoteKey)
    }
    
    func viewMoveInFromRight(nextView:UIView!,aniTime:Float!,animoteKey:String!){
        let animation:CATransition = CATransition()
        animation.duration = CFTimeInterval(aniTime)
        animation.type = "moveIn"
        animation.timingFunction = CAMediaTimingFunction(name: "easeInEaseOut")
        animation.subtype = "fromRight"
        animation.fillMode = "forwards"
        nextView.layer.addAnimation(animation, forKey: animoteKey)
    }
    
    @IBAction func leftSwipe(sender: UISwipeGestureRecognizer) {
        viewMoveInFromRight(self.view.viewWithTag(5), aniTime: 0.2, animoteKey: "")
        if swipeKeyStyle == true {
            if keyType == 7 || brassType == 7 || nickelType == 7 {
                keyType = 1; brassType = 1; nickelType = 1
            } else {
                keyType++; brassType++; nickelType++
            }
            self.view.viewWithTag(5)!.setNeedsDisplay()
            colorCheck()
            print(keyType)
            switchStyle()
        }
    }
    
    @IBAction func rightSwipe(sender: UISwipeGestureRecognizer) {
        viewMoveInFromLeft(self.view.viewWithTag(5), aniTime: 0.2, animoteKey: "")
        if swipeKeyStyle == true {
            if keyType == 1 || brassType == 1 || nickelType == 1 {
                keyType = 7; brassType = 7; nickelType = 7
            } else {
                keyType--; brassType--; nickelType--
            }
            self.view.viewWithTag(5)!.setNeedsDisplay()
            colorCheck()
            print(keyType)
            //print(colorCheck())
            switchStyle()
        }
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
    
    @IBAction func clearButtonPressed(sender: AnyObject) {
        
        swipeKeyStyle = false
        keyType = 4
        wireView = true
        lineOneLabel.hidden = true
        lineOneLabel.text = ""
        
        lineTwoLabel.hidden = true
        lineTwoLabel.text = ""
        
        lineThreeLabel.hidden = true
        lineThreeLabel.text = ""
        
        lineOneTextField.hidden = false
        lineOneTextField.text = ""
        
        lineTwoTextField.hidden = true
        lineTwoTextField.text = ""
        
        lineThreeTextField.hidden = true
        lineThreeTextField.text = ""
        
        descriptionLabel.text = ""
        
        arcText.hidden = true
        
//        lineOneConstraint.constant = -81
//        lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
//        lineTwoConstraint.constant = -108
//        lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
//        lineThreeConstraint.constant = -135
//        lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25.5)
        
        keyView.setNeedsDisplay()

        
        //self.view.viewWithTag(5)!.setNeedsDisplay()
        //self.view.setNeedsDisplay()
    }
    
    @IBAction func previewIconButton(sender: AnyObject) {
        previewButton.tintColor = UIColor(red: 0/256, green: 122/256, blue: 255/256, alpha: 1.0)
        editButton.tintColor = UIColor.darkGrayColor()
        materialSelector.hidden = false
        materialSelector.selectedSegmentIndex = 0
        clearButton.enabled = false
        selectButton.enabled = false
        
        brassView = true
        nickelView = false
        wireView = false
        switchStyle()
        colorCheck()
        self.view.viewWithTag(5)!.setNeedsDisplay()
    }
    
    @IBAction func editButtonPressed(sender: AnyObject) {
        editButton.tintColor = UIColor(red: 0/256, green: 122/256, blue: 255/256, alpha: 1.0)
        previewButton.tintColor = UIColor.darkGrayColor()
        materialSelector.hidden = true
        materialSelector.selectedSegmentIndex = 0
        clearButton.enabled = true
        selectButton.enabled = true
        brassView = false
        nickelView = false
        wireView = true
        switchStyle()
        colorCheck()
        self.view.viewWithTag(5)!.setNeedsDisplay()
    }
    
    func style1FontSetup() {
        if let lineOneLabel_ = lineOneLabel {
            
//            lineOneConstraint.constant = -78
//            lineOneLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 24)
            
                if keyType == 1 || brassType == 1 || nickelType == 1 {
                    lineOneLabel_.hidden = true
                    arcText.hidden = false
                    //////
                    let size = CGSize(width: 360, height: 360)
                    
                    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                    let context = UIGraphicsGetCurrentContext()!
                    // *******************************************************************
                    // Scale & translate the context to have 0,0
                    // at the centre of the screen maths convention
                    // Obviously change your origin to suit...
                    // *******************************************************************
                    CGContextTranslateCTM (context, size.width / 2, size.height / 2)
                    CGContextScaleCTM (context, 1, -1)
                    if nickelView == true && nickelType != 7 {
                        centreArcPerpendicularText(lineOneTextField.text!, context: context, radius: 100, angle: CGFloat(M_PI_2), colour: darkNickel, font: UIFont(name: "AvenirLTStd-Light", size: 23)!, clockwise: true)
                    }
                    if brassView == true && brassType != 7 {
                        centreArcPerpendicularText(lineOneTextField.text!, context: context, radius: 100, angle: CGFloat(M_PI_2), colour: darkBrass, font: UIFont(name: "AvenirLTStd-Light", size: 23)!, clockwise: true)
                    }
                    if wireView == true {
                        centreArcPerpendicularText(lineOneTextField.text!, context: context, radius: 100, angle: CGFloat(M_PI_2), colour: black, font: UIFont(name: "AvenirLTStd-Light", size: 23)!, clockwise: true)
                    }
                    let image = UIGraphicsGetImageFromCurrentImageContext()
                    image
                    UIGraphicsEndImageContext()
                    arcText.image = image
                    
                    ////////
                } else {
                    lineOneLabel_.hidden = false
                    arcText.hidden = true
                }
            }

        if let lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            lineThreeLabel_.hidden = false
            lineTwoConstraint.constant = -120
            lineTwoLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            lineThreeConstraint.constant = -141
            lineThreeLabel_.font = UIFont(name: "AvenirLTStd-Light", size: 22)
        }
    }
    
    func style2FontSetup() {
        if let lineOneLabel_ = lineOneLabel, lineTwoLabel_ = lineTwoLabel, lineThreeLabel_ = lineThreeLabel {
            //checkForStyle1()
            lineOneLabel_.hidden = false
            arcText.hidden = true
            lineThreeLabel_.hidden = false
            //checkForStyle4()
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
            //checkForStyle1()
            lineOneLabel_.hidden = false
            arcText.hidden = true
            lineThreeLabel_.hidden = true

            //checkForStyle4()
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
            //checkForStyle1()
            lineOneLabel_.hidden = false
            arcText.hidden = true
            lineThreeLabel_.hidden = false

            //checkForStyle4()
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
            //checkForStyle1()
            lineOneLabel_.hidden = false
            arcText.hidden = true
            lineThreeLabel_.hidden = false

            //checkForStyle4()
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
            //checkForStyle1()
            lineOneLabel_.hidden = false
            arcText.hidden = true
            lineThreeLabel_.hidden = false

            //checkForStyle4()
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
            //checkForStyle1()
            lineOneLabel_.hidden = false
            lineThreeLabel_.hidden = false
            arcText.hidden = true

            //checkForStyle4()
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
            descriptionLabel.text! = "Incised Style 1"
            style1FontSetup()
        }
        if keyType == 2 || brassType == 2 || nickelType == 2 {
            descriptionLabel.text! = "Incised Style 2"
            style2FontSetup()
        }
        if keyType == 3 || brassType == 3 || nickelType == 3 {
            descriptionLabel.text! = "Incised Style 4"
            style4FontSetup()
        }
        if keyType == 4 || brassType == 4 || nickelType == 4 {
            descriptionLabel.text! = "Incised Style 5"
            style5FontSetup()
        }
        if keyType == 5 || brassType == 5 || nickelType == 5 {
            descriptionLabel.text! = "Incised Style 6"
            style6FontSetup()
        }
        if keyType == 6 || brassType == 6 || nickelType == 6 {
            descriptionLabel.text! = "Incised Style 8"
            style8FontSetup()
        }
        if keyType == 7 || brassType == 7 || nickelType == 7 {
            descriptionLabel.text! = "Embossed"
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
    
//    func checkForStyle4() {
//        if let lineThreeLabel_ = lineThreeLabel {
//            if keyType == 3 || brassType == 3 || nickelType == 3 {
//                lineThreeLabel_.hidden = true
//            } else {
//                lineThreeLabel_.hidden = false
//            }
//        }
//    }
    
//    func checkForStyle1() {
//        
//        if let lineOneLabel_ = lineOneLabel {
//            if keyType == 1 || brassType == 1 || nickelType == 1 {
//                lineOneLabel_.hidden = true
//                arcText.hidden = false
//                //////
//                let size = CGSize(width: 360, height: 360)
//                
//                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//                let context = UIGraphicsGetCurrentContext()!
//                // *******************************************************************
//                // Scale & translate the context to have 0,0
//                // at the centre of the screen maths convention
//                // Obviously change your origin to suit...
//                // *******************************************************************
//                CGContextTranslateCTM (context, size.width / 2, size.height / 2)
//                CGContextScaleCTM (context, 1, -1)
//                if nickelView == true && nickelType != 7 {
//                centreArcPerpendicularText(lineOneTextField.text!, context: context, radius: 100, angle: CGFloat(M_PI_2), colour: darkNickel, font: UIFont(name: "AvenirLTStd-Light", size: 23)!, clockwise: true)
//                }
//                if brassView == true && brassType != 7 {
//                centreArcPerpendicularText(lineOneTextField.text!, context: context, radius: 100, angle: CGFloat(M_PI_2), colour: darkBrass, font: UIFont(name: "AvenirLTStd-Light", size: 23)!, clockwise: true)
//                }
//                if wireView == true {
//                centreArcPerpendicularText(lineOneTextField.text!, context: context, radius: 100, angle: CGFloat(M_PI_2), colour: black, font: UIFont(name: "AvenirLTStd-Light", size: 23)!, clockwise: true)
//                }
//                let image = UIGraphicsGetImageFromCurrentImageContext()
//                image
//                UIGraphicsEndImageContext()
//                arcText.image = image
//                
//                ////////
//            } else {
//                lineOneLabel_.hidden = false
//                arcText.hidden = true
//            }
//        }
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func centreArcPerpendicularText(str: String, context: CGContextRef, radius r: CGFloat, angle theta: CGFloat, colour c: UIColor, font: UIFont, clockwise: Bool){
        // *******************************************************
        // This draws the String str around an arc of radius r,
        // with the text centred at polar angle theta
        // *******************************************************
        
        let l = str.characters.count
        let attributes = [NSFontAttributeName: font]
        
        var characters: [String] = [] // This will be an array of single character strings, each character in str
        var arcs: [CGFloat] = [] // This will be the arcs subtended by each character
        var totalArc: CGFloat = 0 // ... and the total arc subtended by the string
        
        // Calculate the arc subtended by each letter and their total
        for i in 0 ..< l {
            characters += [String(str[str.startIndex.advancedBy(i)])]
            arcs += [chordToArc(characters[i].sizeWithAttributes(attributes).width, radius: r)]
            totalArc += arcs[i]
        }
        
        // Are we writing clockwise (right way up at 12 o'clock, upside down at 6 o'clock)
        // or anti-clockwise (right way up at 6 o'clock)?
        let direction: CGFloat = clockwise ? -1 : 1
        let slantCorrection = clockwise ? -CGFloat(M_PI_2) : CGFloat(M_PI_2)
        
        // The centre of the first character will then be at
        // thetaI = theta - totalArc / 2 + arcs[0] / 2
        // But we add the last term inside the loop
        var thetaI = theta - direction * totalArc / 2
        
        for i in 0 ..< l {
            thetaI += direction * arcs[i] / 2
            // Call centerText with each character in turn.
            // Remember to add +/-90º to the slantAngle otherwise
            // the characters will "stack" round the arc rather than "text flow"
            centreText(characters[i], context: context, radius: r, angle: thetaI, colour: c, font: font, slantAngle: thetaI + slantCorrection)
            // The centre of the next character will then be at
            // thetaI = thetaI + arcs[i] / 2 + arcs[i + 1] / 2
            // but again we leave the last term to the start of the next loop...
            thetaI += direction * arcs[i] / 2
        }
    }
    
    func chordToArc(chord: CGFloat, radius: CGFloat) -> CGFloat {
        // *******************************************************
        // Simple geometry
        // *******************************************************
        return 2 * asin(chord / (2 * radius))
    }
    
    func centreText(str: String, context: CGContextRef, radius r:CGFloat, angle theta: CGFloat, colour c: UIColor, font: UIFont, slantAngle: CGFloat) {
        // *******************************************************
        // This draws the String str centred at the position
        // specified by the polar coordinates (r, theta)
        // i.e. the x= r * cos(theta) y= r * sin(theta)
        // and rotated by the angle slantAngle
        // *******************************************************
        
        // Set the text attributes
        let attributes = [NSForegroundColorAttributeName: c,
            NSFontAttributeName: font]
        // Save the context
        CGContextSaveGState(context)
        // Undo the inversion of the Y-axis (or the text goes backwards!)
        CGContextScaleCTM(context, 1, -1)
        // Move the origin to the centre of the text (negating the y-axis manually)
        CGContextTranslateCTM(context, r * cos(theta), -(r * sin(theta)))
        // Rotate the coordinate system
        CGContextRotateCTM(context, -slantAngle)
        // Calculate the width of the text
        let offset = str.sizeWithAttributes(attributes)
        // Move the origin by half the size of the text
        CGContextTranslateCTM (context, -offset.width / 2, -offset.height / 2) // Move the origin to the centre of the text (negating the y-axis manually)
        // Draw the text
        str.drawAtPoint(CGPointZero, withAttributes: attributes)
        // Restore the context
        CGContextRestoreGState(context)
    }
}
