//
//  FieldAViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 23/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView

class FieldAViewController: UIViewController {

    @IBOutlet var FieldAPv: CTPanoramaView!

    override func viewWillAppear(_ animated: Bool) {
        FieldAPv.controlMethod = .motion
        FieldAPv.image = UIImage(named: "Field_1a")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
