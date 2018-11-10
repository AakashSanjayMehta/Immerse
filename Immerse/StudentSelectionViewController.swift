//
//  StudentSelectionViewController.swift
//  Immerse
//
//  Created by Ben Woo on 10/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class StudentSelectionViewController: UIViewController {
    
    @IBOutlet weak var student_1: UIButton!
    @IBOutlet weak var student_2: UIButton!
    @IBOutlet weak var student_3: UIButton!
    @IBOutlet weak var student_4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        student_1.layer.cornerRadius = student_1.frame.width / 2
        student_2.layer.cornerRadius = student_2.frame.width / 2
        student_3.layer.cornerRadius = student_3.frame.width / 2
        student_4.layer.cornerRadius = student_4.frame.width / 2
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
