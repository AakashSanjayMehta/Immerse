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
    var view360_identifier: String?
    
    @IBOutlet weak var Place_name: UITextView!
    @IBOutlet weak var Place_image: UIImageView!
    @IBOutlet weak var Place_description: UITextView!
    @IBOutlet weak var view360_btn: UIButton!
    @IBOutlet weak var back_btn: UIButton!
    
    @IBAction func view360_button(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: view360_identifier!)
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
        
            switch place {
            
            // Block A
            case "Library":
                Place_name.text = "Library"
                Place_image.image = UIImage(named: "Library_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Library"
                
            case "General_Office": // NOT DONE
                Place_name.text = "General Office (NOT DONE)"
                Place_image.image = UIImage(named: "")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = ""
            
            case "Eletronic_Labs": // NOT DONE
                Place_name.text = "Eletronic Labs (NOT DONE)"
                Place_image.image = UIImage(named: "")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = ""
            
            // Block B
            case "Cafe":
                Place_name.text = "Good News Cafe"
                Place_image.image = UIImage(named: "Cafe_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Cafe"
                
            case "Pond":
                Place_name.text = "School Pond"
                Place_image.image = UIImage(named: "Pond_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Pond"
                
            // Block C
            case "SST_Inc":
                Place_name.text = "SST Inc."
                Place_image.image = UIImage(named: "Inc_1b")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Inc"
                
            case "Robotics@apex": // NOT DONE
                Place_name.text = "Robotics @ APEX (NOT DONE)"
                Place_image.image = UIImage(named: "")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = ""
                
            case "S1S3_clasrooms":
                Place_name.text = "Level 4 clasrooms"
                Place_image.image = UIImage(named: "L4Class_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Classrooms"
                
            case "Biotech_Lab":
                Place_name.text = "Biotech Lab"
                Place_image.image = UIImage(named: "Field_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Biotech"
                
            case "Makers'_Lab":
                Place_name.text = "Makers' Lab"
                Place_image.image = UIImage(named: "MakerLab_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Makers_Lab"
                
            case "Canteen":
                Place_name.text = "Canteen"
                Place_image.image = UIImage(named: "Canteen_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Canteen"
                
            // Block D
            case "Field":
                Place_name.text = "School Field"
                Place_image.image = UIImage(named: "Field_1a")
                Place_description.text = "EMPTY HOLDER"
                view360_identifier = "Field"
            
            default: break
                
            }
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
