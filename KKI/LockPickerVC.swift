//
//  LockPickerVC.swift
//  Kustom Key
//
//  Created by Richard Hayden on 10/23/15.
//  Copyright © 2015 richayden. All rights reserved.
//

import UIKit
import CoreGraphics
@IBDesignable


class LockPickerVC: UIViewController, UIPickerViewDataSource,  UIPickerViewDelegate, UITextFieldDelegate  {
    
    var pickerDataSource = ["US3 Polished Brass", "US5 Antique Brass", "US15 Satin Nickel", "US10B Oil Rubbed Bronze"]

    
    @IBOutlet weak var quantityLocks: UITextField!
    @IBOutlet weak var lockFinishPicker: UIPickerView!
    
    @IBOutlet weak var lockImageView: UIImageView!
    
    @IBOutlet weak var progradeLockLogo: progradeLogo!

        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Prograde Model 5762"    
        lockFinishPicker.dataSource = self
        lockFinishPicker.delegate = self
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
        let item = UIBarButtonItem(title: "ADD TO CART", style: UIBarButtonItemStyle.Done, target: self, action: Selector("endEditingNow") )
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let toolbarButtons = [flexibleSpace, item, flexibleSpace]
        
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

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == lockFinishPicker {
            return 1
        }
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == lockFinishPicker {
            return pickerDataSource.count
        }
        return 0
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(row == 0)
        {

            lockImageView.image = UIImage(named: "5762polished")
        }
        else if(row == 1)
        {
            lockImageView.image = UIImage(named: "5762antique")
        }
        else if(row == 2)
        {
            lockImageView.image = UIImage(named: "5762satin")
        } else if (row == 3) {
            lockImageView.image = UIImage(named: "5762rubbed")
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        pickerView.subviews[1].hidden = true
        pickerView.subviews[2].hidden = true
        var pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = pickerDataSource[row]
        //pickerLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
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
