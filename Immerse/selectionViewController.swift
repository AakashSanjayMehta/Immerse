//
//  selectionViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 22/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import SafariServices

class selectionViewController: UIViewController {
    
    var websiteURL = "https://www.sst.edu.sg"
    
    @IBAction func Dpressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Still in progress", message: "This block has not been implemented yet. We apologize for the inconvenience.", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func aboutSST(_ sender: Any) {
        let s = SFSafariViewController(url: URL(string: websiteURL)!)
        self.present(s, animated: true, completion: nil)
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
