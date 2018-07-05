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
    
    @IBOutlet weak var About_SST: UIButton!
    @IBOutlet weak var Milestone: UIButton!
    @IBOutlet weak var V_M_V_G: UIButton!
    @IBOutlet weak var SST_Experience: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Round corners
        About_SST.clipsToBounds = true
        Milestone.clipsToBounds = true
        V_M_V_G.clipsToBounds = true
        SST_Experience.clipsToBounds = true
        About_SST.layer.cornerRadius = 10
        Milestone.layer.cornerRadius = 10
        V_M_V_G.layer.cornerRadius = 10
        SST_Experience.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Block D button
    @IBAction func Dpressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Still in progress", message: "This block has not been implemented yet. We apologize for the inconvenience.", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //
    @IBAction func website_link(_ sender: Any) {
        switch ((sender as AnyObject).tag) {
            // About SST
            case 0: websiteURL = "https://www.sst.edu.sg/our-school/about-sst/"
            // Milestones
            case 1: websiteURL = "https://www.sst.edu.sg/milestones/"
            // Vision, Mission, Values and goals
            case 2: websiteURL = "https://www.sst.edu.sg/our-school/vision-mission-values-goals/"
            // The SST Experience
            case 3: websiteURL = "https://www.sst.edu.sg/our-school/the-sst-experience/"
            default: break
        }
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
