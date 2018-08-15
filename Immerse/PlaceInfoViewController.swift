//
//  PlaceInfo.swift
//  Immerse
//
//  Created by Ben Woo on 10/8/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class PlaceInfoViewController: UIViewController {

    var place: String?
    
    @IBOutlet weak var Place_name: UITextView!
    @IBOutlet weak var Place_image: UIImageView!
    @IBOutlet weak var Place_description: UITextView!
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
        
        back_btn.clipsToBounds = true
        view360_btn.clipsToBounds = true
        
        view360_btn.layer.cornerRadius = 20
        back_btn.layer.cornerRadius = back_btn.frame.width / 2

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // changing to correct place name
        if UserDefaults.standard.string(forKey: "place name") != nil {
            place = UserDefaults.standard.string(forKey: "place name")!
        }
        
        switch place {
        case "Field":
            Place_name.text = place
            Place_image.image = UIImage(named: "Field_1a")
            Place_description.text = place
            
        default: break
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
