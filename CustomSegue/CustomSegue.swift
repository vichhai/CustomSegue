//
//  CustomSegue.swift
//  
//
//  Created by vichhai on 7/9/15.
//
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    override func perform() {
        
        // assign the source and destination view to local variables
        var sourceVC = self.sourceViewController.view as UIView!
        var destinationVC = self.destinationViewController.view as UIView!
        
        // get the screen width and height
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        destinationVC.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one
        let window  = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(destinationVC, aboveSubview: sourceVC)
        
        // Animate the transistion
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            sourceVC.frame = CGRectOffset(sourceVC.frame, 0.0, -screenHeight)
            destinationVC.frame = CGRectOffset(destinationVC.frame, 0.0, -screenHeight)
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController,
                    animated: false,
                    completion: nil)
        }
    }
    
}
