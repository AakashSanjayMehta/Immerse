//
//  PlaceInfo.swift
//  Immerse
//
//  Created by Ben Woo on 10/8/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class PlaceInfoViewController: UIViewController {

    @IBOutlet weak var Place_name: UILabel!
    @IBOutlet weak var Place_image: UIImageView!
    @IBOutlet weak var view360_btn: UIButton!
    @IBOutlet weak var back_btn: UIButton!
    
    @IBAction func view360_button(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Field")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func back_button(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view360_btn.layer.cornerRadius = 20
        back_btn.layer.cornerRadius = back_btn.frame.width / 2
        
        // changing to correct place name
        if UserDefaults.standard.string(forKey: "place name") != nil {
            Place_name.text = UserDefaults.standard.string(forKey: "place name")!
        }
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
