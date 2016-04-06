//
//  ViewController.swift
//  RKSwiftAlerts
//
//  Created by ram on 06/04/16.
//  Copyright © 2016 Rgraphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ShowsAlert {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTapShowAlert(sender: UIButton) {
        showAlert(message: "Hello World")
    }
    @IBAction func onTapShowAlertWithAction(sender: UIButton) {
        showAlertWithAction("Alert", message: "Sample Alert", buttons: ["Cancel","Ok"]) { (buttonPressed) in
            switch buttonPressed {
                case "Cancel": break
                case "Ok":
                // do something
                break
            default : break
            }
        }
    }
    @IBAction func onTapAlertActionWithTextField(sender: UIButton) {
        
        showAlertWithTextFiled("Alert", message: "Enter Text Below.!", textFieldplaceHolder: "Enter Text", buttons: ["Cancel","Ok"]) { (buttonPressed, textFieldText) in
            switch buttonPressed {
            case "Cancel": break
            case "Ok":
                // do something
                break
            default : break
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

