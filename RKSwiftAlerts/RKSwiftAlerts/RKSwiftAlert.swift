//
//  RKSwiftAlert.swift
//  RKSwiftAlerts
//
//  Created by ram on 06/04/16.
//  Copyright © 2016 Rgraphy. All rights reserved.
//

import UIKit


protocol ShowsAlert {}
/**
 Tells the protocol used for showing Alrts iOS 8 onwords
 
 */
extension ShowsAlert where Self: UIViewController {
    func showAlert(title: String = "Error", message: String) {
        if #available(iOS 8.0, *) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func showAlertWithAction(title: String, message: String, buttons : [String], completion: ((buttonPressed: String) -> Void)?) {
        if #available(iOS 8.0, *) {
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            for b in buttons {
                
                alertView.addAction(UIAlertAction(title: b, style: UIAlertActionStyle.Default, handler: {
                    (action : UIAlertAction) -> Void in
                    completion!(buttonPressed: action.title!)
                }))
            }
            self.presentViewController(alertView, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
        
    }
    func showAlertWithTextFiled(title: String, message: String,textFieldplaceHolder:String, buttons: [String], completion: ((buttonPressed: String,textFieldText:String) -> Void)?)  {
        if #available(iOS 8.0, *) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            alertController.addTextFieldWithConfigurationHandler(
                {(textField: UITextField!) in
                    textField.placeholder = textFieldplaceHolder
            })
            for buttonTitle in buttons {
                alertController.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.Default, handler: { (button: UIAlertAction) -> Void in
                    if let textFields = alertController.textFields{
                        let theTextFields = textFields as [UITextField]
                        let enteredText = theTextFields[0].text
                        completion!(buttonPressed:button.title!, textFieldText:enteredText!)
                    }
                }))
            }
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }
}