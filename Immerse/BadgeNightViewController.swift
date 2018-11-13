//
//  BadgeNightViewController.swift
//  Immerse
//
//  Created by Ben Woo on 13/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class BadgeNightViewController: UIViewController {
    
    @IBOutlet weak var MoveOn_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MoveOn_btn.layer.cornerRadius = MoveOn_btn.frame.height / 2
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
