//
//  AddressBookViewController.swift
//  CustomSegue
//
//  Created by vichhai on 7/10/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class AddressBookViewController: UIViewController,UIAlertViewDelegate {
    var shakes : Int!
    var direction : Int!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var givImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Background color
        UIGraphicsBeginImageContext(self.view.frame.size);
        UIImage(named: "splashBG")!.drawInRect(self.view.bounds)
        var backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        
        // Add the blur visual effect on the background color
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        view.addSubview(blurEffectView)
        view.sendSubviewToBack(blurEffectView)
        loginBtn.layer.cornerRadius = 5
        
        
        var imageData = NSData(contentsOfURL: NSBundle.mainBundle()
            .URLForResource("owl", withExtension: "gif")!)
        let gifImage = UIImage.animatedImageWithData(imageData!)
        givImage.image = gifImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnClicked(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Login",
            message: "Input user name and password",
            preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Save",
            style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Destructive) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "User name"

        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
            textField.addTarget(self, action: "textFieldChage:", forControlEvents: UIControlEvents.EditingChanged)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }

    func textFieldChage(sender:UITextField) {
        println(sender.text)
    }

}
