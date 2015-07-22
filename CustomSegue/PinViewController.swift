//
//  PinViewController.swift
//  CustomSegue
//
//  Created by vichhai on 7/10/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class PinViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    //MARK: - TableView Methods and Datasource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 90
    }
}
