//
//  MainViewController.swift
//  CustomSegue
//
//  Created by vichhai on 7/9/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

struct Candy {
    let category : String
    let name : String
    let image : String
}

class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var mySearch: UISearchBar!

    var candies = [Candy]()
    var filteredCandies = [Candy]()
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainTableView.backgroundView = UIImageView(image: UIImage(named: "background"))
//        self.candies = [Candy(category:"Chocolate", name:"chocolate Bar",image:"chocolate bar.jpg"),
//            Candy(category:"Chocolate", name:"chocolate Chip",image:"chocolate chip.jpg"),
//            Candy(category:"Chocolate", name:"dark chocolate",image:"dark chocolate.jpg"),
//            Candy(category:"Hard", name:"lollipop",image:"lollipop.jpg"),
//            Candy(category:"Hard", name:"candy cane",image:"candy cane.jpg"),
//            Candy(category:"Hard", name:"jaw breaker",image:"jaw breaker.jpg"),
//            Candy(category:"Other", name:"caramel",image:"caramel.jpg"),
//            Candy(category:"Other", name:"sour chew",image:"sour chew.jpg"),
//            Candy(category:"Other", name:"gummi bear",image:"gummi bear.jpg")]

        self.candies = [Candy(category:"Chocolate", name:"chocolate Bar",image:"1"),
            Candy(category:"Chocolate", name:"chocolate Chip",image:"2"),
            Candy(category:"Chocolate", name:"dark chocolate",image:"3"),
            Candy(category:"Hard", name:"lollipop",image:"4"),
            Candy(category:"Hard", name:"candy cane",image:"5"),
            Candy(category:"Hard", name:"jaw breaker",image:"6"),
            Candy(category:"Other", name:"caramel",image:"7"),
            Candy(category:"Other", name:"sour chew",image:"8"),
            Candy(category:"Other", name:"gummi bear",image:"9")]
        // Reload the table
        self.mainTableView.reloadData()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:
    //MARK: TableView delegate and data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filteredCandies.count
        }
        return self.candies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        
        var candy : Candy
        
        if searchActive {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = self.candies[indexPath.row]
        }

        cell.sharelabel[0].text = candy.name
        cell.sharelabel[1].text = candy.category
        
        var imageData = NSData(contentsOfURL: NSBundle.mainBundle()
            .URLForResource(candy.image, withExtension: "gif")!)
        let gifImage = UIImage.animatedImageWithData(imageData!)
        
        cell.imageCell.image = gifImage
        
        
        return cell
    }
    
    //MARK:
    //MARK: search bar delegate
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredCandies = candies.filter({ (candy:Candy) -> Bool in
//            var stringMatch = candy.name.rangeOfString(searchText)
//            return stringMatch != nil
//        })
        self.filterContentForSearchText(searchText)
        
        if filteredCandies.count == 0 {
            searchActive = false
        } else {
            searchActive = true
        }
        mainTableView.reloadData()
    }
    
    //MARK: 
    //MARK: Other functions
    func filterContentForSearchText(searchText: String) {
        self.filteredCandies = self.candies.filter({( candy : Candy) -> Bool in
            var stringMatch = candy.name.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }

}
