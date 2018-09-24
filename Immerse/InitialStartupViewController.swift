//
//  InitialStartupViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 27/8/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class InitialStartupViewController: UIViewController {

    @IBOutlet weak var start_btn: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startTouched(_ sender: Any) {
        UserDefaults.standard.set("DONE", forKey: "beenToStart")
        performSegue(withIdentifier: "toMain", sender: self)
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
