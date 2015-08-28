//
//  ViewController.swift
//  KKI
//
//  Created by Richard Hayden on 8/13/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

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
    
    @IBOutlet weak var renderButton: UIButton!
    
    @IBOutlet weak var orderButton: UIButton!
    
    @IBOutlet weak var startOverButton: UIButton!
        
    @IBOutlet weak var keyImageView: UIImageView!
    
    @IBOutlet weak var keyView: Styles!
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    var showPreview: Bool = false
    
    var counter = 4
    

    
    let renderedTextColor = UIColor(red: 132/255, green: 112/255, blue: 12/255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        
        
        
        
        
        
        self.lineOneTextField.delegate = self
        self.lineTwoTextField.delegate = self
        self.lineThreeTextField.delegate = self
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
                
                let alert = UIAlertView()
                alert.title = "Oops"
                alert.message = "Please Enter Text In The Box"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            else {
               
                lineOneLabel.text = lineOneTextField.text
                lineOneLabel.textAlignment = NSTextAlignment.Center

                lineOneLabel.hidden = false
                lineOneLabel.text = lineOneTextField.text
                lineOneTextField.hidden = true
                lineTwoTextField.hidden = false
                lineTwoTextField.enablesReturnKeyAutomatically = false
                lineOneTextField.resignFirstResponder()
                self.lineTwoTextField.becomeFirstResponder()
                
                }
            }
        
        if textField == self.lineTwoTextField {
        
            if lineTwoTextField.text!.isEmpty {
                
                let alert = UIAlertView()
                alert.title = "Oops"
                alert.message = "Please Enter Text In The Box"
                alert.addButtonWithTitle("Ok")
                alert.show()
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
                
                let alert = UIAlertView()
                alert.title = "Oops"
                alert.message = "Please Enter Text In The Box"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            else {
                lineThreeLabel.hidden = false
                lineThreeLabel.text = lineThreeTextField.text
                lineThreeTextField.hidden = true
                renderButton.hidden = false
                RButton.hidden = false
                LButton.hidden = false
                lineThreeTextField.resignFirstResponder()
            }
        }
            return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    @IBAction func orderSelectionButtonPressed(sender: UIButton) {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let screenshot = self.view?.pb_takeSnapshot()
        
        //UIImageJPEGRepresentation(screenshot!, 1)
        
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
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
        
        

        
        
        if counter == 7 {
            
            counter = 1
            
        } else {
            
            counter++
            
        }
        if showPreview == true {
            
            keyImageView.image = UIImage(named: "styleR\(counter)")
            if keyImageView.image == UIImage(named: "styleR7") {
                lineOneLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                lineTwoLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                lineThreeLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                
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
        else {
        keyImageView.image = UIImage(named: "styleW\(counter)")
        }
        
        // If kki style 1 is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW1") || keyImageView.image == UIImage(named: "styleR1") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 175)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 217)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
        }
        
        // If kki style 2 (styleW2) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW2") || keyImageView.image == UIImage(named: "styleR2") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 180)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 211)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 21)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }

        // If kki style 4 (styleW3) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW3") || keyImageView.image == UIImage(named: "styleR3"){
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 180)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 211)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 21)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }

        // If kki style 5 (styleW4) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW4") || keyImageView.image == UIImage(named: "styleR4"){
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 177)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 204)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 231)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
        }
        
        // If kki style 6 (styleW5) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW5") || keyImageView.image == UIImage(named: "styleR5") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 180)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 24)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 200)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 18)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
        }
        
        // If kki style 8 (styleW6) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW6") || keyImageView.image == UIImage(named: "styleR6"){
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 175)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 24)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 200)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 18)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 225)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }
        
        // If kki style E (styleW7) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW7") || keyImageView.image == UIImage(named: "styleR7") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 177)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Black", size: 24)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 202)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Black", size: 23)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 225)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Black", size: 21)
        }
        print(showPreview)
    }
    @IBOutlet weak var test: Styles!
    
    @IBAction func backStyleButtonPressed(sender: UIButton) {
        
        if counter == 1 {
            
            counter = 7
            
        } else {
            
            counter--
            
        }
        
        if showPreview == true {
            
            keyImageView.image = UIImage(named: "styleR\(counter)")
            
            if keyImageView.image == UIImage(named: "styleR7") {
                
                lineOneLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                lineTwoLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                lineThreeLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                
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
        else {
        
        keyImageView.image = UIImage(named: "styleW\(counter)")
        }
        
        // If kki style 1 is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW1") || keyImageView.image == UIImage(named: "styleR1") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 175)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 217)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
        }
        
        // If kki style 2 (styleW2) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW2") || keyImageView.image == UIImage(named: "styleR2") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 180)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 211)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 21)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
            
        }
        
        // If kki style 4 (styleW3) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW3") || keyImageView.image == UIImage(named: "styleR3") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 180)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 211)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 21)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }
        
        // If kki style 5 (styleW4) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW4") || keyImageView.image == UIImage(named: "styleR4") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 177)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 204)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 231)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 25)
            
        }
        
        // If kki style 6 (styleW5) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW5") || keyImageView.image == UIImage(named: "styleR5") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 180)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 24)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 200)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 18)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 238)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 22)
            
        }
        
        // If kki style 8 (styleW6) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW6") || keyImageView.image == UIImage(named: "styleR6") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 175)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Light", size: 24)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 200)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Light", size: 18)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 225)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Light", size: 20)
        }
        
        // If kki style E (styleW7) is chosen this moves labels and sets font size
        
        if keyImageView.image == UIImage(named: "styleW7") || keyImageView.image == UIImage(named: "styleR7") {
            
            lineOneLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 177)
            lineOneLabel.font = UIFont(name: "AvenirLTStd-Black", size: 24)
            
            lineTwoLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 202)
            lineTwoLabel.font = UIFont(name: "AvenirLTStd-Black", size: 23)
            
            lineThreeLabel.center = CGPoint(x: self.view.bounds.width / 2, y: 225)
            lineThreeLabel.font = UIFont(name: "AvenirLTStd-Black", size: 21)
            
            //lineThreeLabel.font = lineThreeLabel.font.fontWithSize(20)
        }
        
        print(showPreview)
    }

        @IBAction func renderButtonPressed(sender: UIButton) {
        
        if renderButton.currentTitle == "Preview Mode" {
            
            showPreview = true
            
            keyImageView.image = UIImage(named: "styleR\(counter)")
            
            if keyImageView.image == UIImage(named: "styleR7") {
                
                lineOneLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                lineTwoLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                lineThreeLabel.textColor = UIColor(red: 232/255, green: 192/255, blue: 63/255, alpha: 0.9)
                
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
            
            renderButton.setTitle("Basic Mode", forState: UIControlState.Normal)
            
        }
        else {
            
            if renderButton.currentTitle == "Basic Mode" {
                showPreview = false
                
                keyImageView.image = UIImage(named: "styleW\(counter)")
                
                lineOneLabel.textColor = UIColor.blackColor()
                lineTwoLabel.textColor = UIColor.blackColor()
                lineThreeLabel.textColor = UIColor.blackColor()
                
                lineOneLabel.shadowColor = nil
                lineTwoLabel.shadowColor = nil
                lineThreeLabel.shadowColor = nil
                
                renderButton.setTitle("Preview Mode", forState: UIControlState.Normal)
                
            }
    
        }

        print(showPreview)
        
    }

}
