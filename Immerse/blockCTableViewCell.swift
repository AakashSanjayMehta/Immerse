//
//  File.swift
//  Immerse
//
//  Created by Ben Woo on 6/8/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class blockCTableViewCell: UITableViewCell {

    @IBOutlet weak var Preview_Image: UIImageView!
    @IBOutlet weak var place_name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
