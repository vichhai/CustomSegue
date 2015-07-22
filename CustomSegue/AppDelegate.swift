//
//  AppDelegate.swift
//  CustomSegue
//
//  Created by vichhai on 7/9/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let tabBarController = self.window?.rootViewController as! UITabBarController
        let tabBar = tabBarController.tabBar

        var tabBarItem1 = tabBar.items?[0] as! UITabBarItem
        var tabBarItem2 = tabBar.items?[1] as! UITabBarItem
        var tabBarItem3 = tabBar.items?[2] as! UITabBarItem
        var tabBarItem4 = tabBar.items?[3] as! UITabBarItem
        
        tabBarItem1.title = "Home"
        tabBarItem2.title = "Address Book"
        tabBarItem3.title = "Note"
        tabBarItem4.title = "Pin"
        
        tabBarItem1.image = UIImage(named: "Home-50.png")
        tabBarItem1.selectedImage = UIImage(named: "Home Filled-50.png")
        
        tabBarItem2.image = UIImage(named: "Address Book-50.png")
        tabBarItem2.selectedImage = UIImage(named: "Address Book Filled-50.png")
        
        tabBarItem3.image = UIImage(named: "Note-50.png")
        tabBarItem3.selectedImage = UIImage(named: "Note Filled-50.png")
        
        tabBarItem4.image = UIImage(named: "Pin-50.png")
        tabBarItem4.selectedImage = UIImage(named: "Pin Filled-50.png")
        
        return true
    }
    
}

