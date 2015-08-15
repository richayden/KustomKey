//
//  ViewController.swift
//  KKI
//
//  Created by Richard Hayden on 8/13/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lineOneLabel: UILabel!
    @IBOutlet weak var lineTwoLabel: UILabel!
    @IBOutlet weak var lineThreeLabel: UILabel!
    
    @IBOutlet weak var lineOneTextField: UITextField!
    @IBOutlet weak var lineTwoTextField: UITextField!
    @IBOutlet weak var lineThreeTextField: UITextField!
    
    @IBOutlet weak var renderButton: UIButton!
    
    @IBOutlet weak var orderButton: UIButton!
    
    @IBOutlet weak var startOverButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var keyImageView: UIImageView!
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    let renderedTextColor = UIColor(red: 116/255, green: 76/255, blue: 53/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.lineOneTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(lineOneTextField: UITextField) -> Bool {
        
        //textField code
        
        lineOneLabel.hidden = false
        lineOneLabel.text = lineOneTextField.text
        lineOneTextField.hidden = true
        lineTwoTextField.hidden = false

        lineOneTextField.resignFirstResponder()  //if desired
        performAction()
        return true
    }
    
    func performAction() {
        
        //action events
//        if lineOneTextField.text!.isEmpty {
//            
//            let alert = UIAlertView()
//            alert.title = "Oops"
//            alert.message = "Please Enter Text In The Box"
//            alert.addButtonWithTitle("Ok")
//            alert.show()
//        }
//        else {
        
//            lineOneLabel.hidden = false
//            lineOneLabel.text = lineOneTextField.text
//            lineOneTextField.hidden = true
//            lineTwoTextField.hidden = false
            //lineOneTextField.resignFirstResponder()
        }
        
//        func lineTwoTextFieldShouldReturn(lineTwoTextField: UITextField) -> Bool {
//            
//            //textField code
//            lineTwoTextField.returnKeyType = UIReturnKeyType.Next
//            
//            lineTwoTextField.resignFirstResponder()  //if desired
//            performActionForLineTwo()
//            return true
//        }
//        
//        func performActionForLineTwo() {
//            
//            if lineTwoTextField.text!.isEmpty {
//            
//            let alert = UIAlertView()
//            alert.title = "Oops"
//            alert.message = "Please Enter Text In The Box"
//            alert.addButtonWithTitle("Ok")
//            alert.show()
//        }
//        else {
//            lineTwoLabel.hidden = false
//            lineTwoLabel.text = lineTwoTextField.text
//            lineTwoTextField.hidden = true
//            lineThreeTextField.hidden = false
//            lineTwoTextField.resignFirstResponder()
//        }
//            
//            func lineThreeTextFieldShouldReturn(lineThreeTextField: UITextField) -> Bool {
//                
//                //textField code
//                lineThreeTextField.returnKeyType = UIReturnKeyType.Next
//                
//                lineThreeTextField.resignFirstResponder()  //if desired
//                performActionForLineThree()
//                return true
//            }
//            
//            func performActionForLineThree() {
//                
//                if lineThreeTextField.text!.isEmpty {
//            
//            let alert = UIAlertView()
//            alert.title = "Oops"
//            alert.message = "Please Enter Text In The Box"
//            alert.addButtonWithTitle("Ok")
//            alert.show()
//        }
//        else {
//            
//            lineThreeLabel.hidden = false
//            lineThreeLabel.text = lineThreeTextField.text
//            lineThreeTextField.hidden = true
//            renderButton.hidden = false
//            lineThreeTextField.resignFirstResponder()
//        }
//
//
//
//    
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
        
    @IBAction func renderButtonPressed(sender: UIButton) {
        
        keyImageView.image = UIImage(named: "s5Rend")
        lineOneLabel.textColor = renderedTextColor
        lineTwoLabel.textColor = renderedTextColor
        lineThreeLabel.textColor = renderedTextColor
        
        lineOneLabel.shadowColor = UIColor.yellowColor()
        lineTwoLabel.shadowColor = UIColor.yellowColor()
        lineThreeLabel.shadowColor = UIColor.yellowColor()
        
        renderButton.hidden = true
        orderButton.hidden = false
        startOverButton.hidden = false
        titleLabel.hidden = true
        
    }

}
