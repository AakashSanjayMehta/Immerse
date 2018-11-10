//
//  OrientationViewController.swift
//  Immerse
//
//  Created by Ben Woo on 10/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class OrientationViewController: UIViewController {
    
    @IBOutlet weak var Question_1: UIButton!
    @IBOutlet weak var Question_2: UIButton!
    @IBOutlet weak var Question_3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Question_1.layer.cornerRadius = 10
        Question_2.layer.cornerRadius = 10
        Question_3.layer.cornerRadius = 10
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
