//
//  ViewController.swift
//  CustomSegue
//
//  Created by vichhai on 7/9/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
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
        
        loginBtn.layer.cornerRadius = 5.0
        username.layer.cornerRadius = 5.0
        password.layer.cornerRadius = 5.0
        
        
        username.alpha = 0
        username.frame.origin.x = -15
        
        password.alpha = 0
        password.frame.origin.x = -15
        
        loginBtn.alpha = 0
        loginBtn.frame.origin.x = -15
        
        UIView.animateKeyframesWithDuration(
            1.0,
            delay: 0,
            options: nil,
            animations: {
                UIView.addKeyframeWithRelativeStartTime(0.2, relativeDuration: 1/3, animations: {
                    self.username.alpha = 1
                    self.username.frame.origin.x = 15
                })
                
                UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 1/3, animations: {
                    self.password.alpha = 1
                    self.password.frame.origin.x = 15
                })
                
                UIView.addKeyframeWithRelativeStartTime(0.8, relativeDuration: 1/3, animations: {
                    self.loginBtn.alpha = 1
                    self.loginBtn.frame.origin.x = 15
                })
            },
            completion: {finished in
                
            }
        )
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(sender: AnyObject) {
        performSegueWithIdentifier("gotoMainView", sender: nil)
    }

}

