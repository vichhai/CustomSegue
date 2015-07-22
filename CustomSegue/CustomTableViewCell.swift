//
//  CustomTableViewCell.swift
//  CustomSegue
//
//  Created by vichhai on 7/9/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var sharelabel: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = true
        
        imageCell.layer.cornerRadius = 10
        imageCell.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
