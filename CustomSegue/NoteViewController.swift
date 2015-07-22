//
//  NoteViewController.swift
//  CustomSegue
//
//  Created by vichhai on 7/10/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var secodeContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        secodeContainer.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func segmentSelectedAction(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
        case 0 :
            firstContainer.hidden = false
            secodeContainer.hidden = true
        case 1:
            firstContainer.hidden = true
            secodeContainer.hidden = false
        default:
            break;
        }
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
