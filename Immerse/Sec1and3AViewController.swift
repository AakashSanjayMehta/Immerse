//
//  Sec1and3AViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView

class Sec1and3AViewController: UIViewController {

    @IBOutlet var IP13aV: CTPanoramaView!
    override func viewDidLoad() {
        super.viewDidLoad()
        IP13aV.controlMethod = .motion
        
        IP13aV.image = UIImage(named: "Seconeandthreeclasess_1a")

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
