//
//  LibraryBViewController.swift
//  Immerse
//
//  Created by Ben Woo on 17/7/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView

class LibraryBViewController: UIViewController {

    @IBOutlet var IPCanteenV: CTPanoramaView!

    override func viewDidLoad() {
        super.viewDidLoad()
        IPCanteenV.controlMethod = .motion
        IPCanteenV.image = UIImage(named: "Library_1b")
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
