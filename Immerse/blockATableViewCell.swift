//
//  blockATableViewCell.swift
//  Immerse
//
//  Created by Ben Woo on 9/8/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class blockATableViewCell: UITableViewCell {

    @IBOutlet var Preview_Image: UIImageView!
    @IBOutlet var place_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
