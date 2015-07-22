//
//  TableViewController.swift
//  CustomSegue
//
//  Created by vichhai on 7/14/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    var indexSet = NSMutableIndexSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - tableview datasource and delegate methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.selectionStyle = .None
        
        for view in cell.contentView.subviews {
            if view.isKindOfClass(UILabel.classForCoder()) {
                view.removeFromSuperview()
            }
            
            if view.isKindOfClass(UIButton.classForCoder()) {
                view.removeFromSuperview()
            }
        }
        
        // create button for cell
        let cellBtn = UIButton(frame: CGRectMake(15,(55 - 30)/2, 30, 30))
        cellBtn.opaque = false
        cellBtn.backgroundColor = UIColor.clearColor()
        cellBtn.setBackgroundImage(UIImage(named: "loading_list_check_no.png"), forState: UIControlState.Normal)
        cellBtn.setBackgroundImage(UIImage(named: "loading_list_check_ok.png"), forState: UIControlState.Selected)
        cellBtn.setBackgroundImage(UIImage(named: "loading_list_check_ok.png"), forState: UIControlState.Highlighted)
        cellBtn.addTarget(self, action: "sectionBtnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        cellBtn.tag = indexPath.row + 1
        
        // create label for cell
        let cellLabel = UILabel(frame: CGRectMake(15 + cellBtn.frame.width + 5, (55 - 30)/2, 250, 30))
        cellLabel.font = UIFont.systemFontOfSize(12)
        cellLabel.textColor = UIColor.blackColor()
        cellLabel.text = "abc" + String(indexPath.row)
        
        switch indexPath.row {
        case 0:
            
            cellBtn.hidden = true
            cellLabel.frame = CGRectMake(17, 0, 250, 30)
            cellLabel.text = "비즈페이 약관"
            cellLabel.textColor = UIColor.lightGrayColor()
            break
        case 3:
            cellBtn.hidden = true
            cellLabel.frame = CGRectMake(17, 0, 250, 30)
            cellLabel.text = "휴대폰 본인 인증서비스 약관"
            cellLabel.textColor = UIColor.lightGrayColor()
            
            let view = UIView(frame: CGRectMake(0, 29, mainTableView.frame.size.width, 1))
            view.backgroundColor = UIColor.lightGrayColor()
            cell.contentView.addSubview(view)
            break
        default: break
        }
       
        
        // add view to cell
        cell.contentView.addSubview(cellBtn)
        cell.contentView.addSubview(cellLabel)
        return cell
    }

    // row height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 3 {
            return 30
        }
        return 55
    }
    
    // how many row in one section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // section(s) that has in table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // section height
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view : UIView = UIView(frame: CGRectMake(0, 0, tableView.frame.width, 55))
        view.backgroundColor = UIColor.lightGrayColor()
        
        let sectionBtn = UIButton(frame: CGRectMake(15,(55 - 30)/2, 30, 30))
        sectionBtn.opaque = false
        sectionBtn.backgroundColor = UIColor.clearColor()
        sectionBtn.setBackgroundImage(UIImage(named: "loading_list_check_no.png"), forState: UIControlState.Normal)
        sectionBtn.setBackgroundImage(UIImage(named: "loading_list_check_ok.png"), forState: UIControlState.Selected)
        sectionBtn.setBackgroundImage(UIImage(named: "loading_list_check_ok.png"), forState: UIControlState.Highlighted)
        sectionBtn.addTarget(self, action: "sectionBtnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        sectionBtn.tag = 1000
        
        view.addSubview(sectionBtn)
        return view
    }
    
    
    //MARK: -
    func sectionBtnClicked(sender : UIButton) {
        switch sender.tag {
        case 1000 :
            setButton(sender)
            setSelectedButton(sender.selected)
        case 1,2,3,4,5:
            indexSet.addIndex(sender.tag)
            setButton(sender)
            println("selected index \(indexSet)")
        default:break
        }
    }
    
    //MARK: - selected buttons action
    func setSelectedButton(type:Bool) {
        let btn1 = self.view.viewWithTag(1) as! UIButton
        let btn2 = self.view.viewWithTag(2) as! UIButton
        let btn3 = self.view.viewWithTag(3) as! UIButton
        let btn4 = self.view.viewWithTag(4) as! UIButton
        let btn5 = self.view.viewWithTag(5) as! UIButton
        
        btn1.selected = type
        btn2.selected = type
        btn3.selected = type
        btn4.selected = type
        btn5.selected = type
    }
    
    func setButton(button:UIButton) {
        if button.selected == true {
            button.selected = false
            indexSet.removeIndex(button.tag)
            println("delete index \(indexSet)")
        } else {
            button.selected = true
        }
    }
    
    
}
