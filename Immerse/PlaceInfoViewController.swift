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
                Place_description.text = "The Info Hub is a venue that encourages individual research and study as well as group collaboration. It has a wealth of educational resources for students and staff in the form of books, magazines, journals and e-resources and these helps to promote literacy development and encourages rigorous research. "
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
                Place_description.text =
                "The good news cafe has a wide variety of chill and western food and drinks at cheap prices. These includes, hot dogs, sandwiches, ice creams and even tea. The seats outside the cafe gives students a quiet place to study, eat or just hangout "
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
                Place_description.text =
                "A unique space for aspiring entrepreneurs, SST INC is a state-of-the-art business incubator which hosts start-up companies run by our Information and Communications Technology Talent Development Programme (ICT TDP) students. Computer workshops, exhibitions and project discussions are held here on a regular basis, and the venue has been the nerve centre for project discussions which have yielded notable results – such as the SST Open House, SST Lens and SST Announcer mobile applications. Students have also created a Maths Notes App for use when revising for their examinations."
                view360_identifier = "Inc"
                
            case "Robotics@apex": // NOT DONE
                Place_name.text = "Robotics @ APEX (NOT DONE)"
                Place_image.image = UIImage(named: "")
                Place_description.text =
                "This area outside the robotics room is also dedicated to the robotics students. However other students may also occupy this area for project meetings and work."
                view360_identifier = ""
                
            case "S1S3_clasrooms":
                Place_name.text = "Level 4 clasrooms"
                Place_image.image = UIImage(named: "L4Class_1a")
                Place_description.text =
                "This is where our classrooms are located. There are 2 floors dedicated to classrooms and on the 4th floor, there are Big Steps where meetings, projects are held. All classrooms (in fact all enclosed rooms in SST) is air-conditioned and has an Apple TV projector usually used during lessons. These facilities help improve the learning environment of the students."
                view360_identifier = "Classrooms"
                
            case "Biotech_Lab":
                Place_name.text = "Biotech Lab"
                Place_image.image = UIImage(named: "BiotechLab_1a")
                Place_description.text =
                "This is where one of our Applied Subjects, Biotechnology is conducted. These labs have special equipments that are not found in other labs. Biotechnology students will be able to learn more about cell culture technology, microbial technology and recombinant DNA technology through experiments and practicals conducted in this lab."
                view360_identifier = "Biotech"
                
            case "Makers'_Lab":
                Place_name.text = "Makers' Lab"
                Place_image.image = UIImage(named: "MakerLab_1a")
                Place_description.text =
                "The SST Maker Lab is a fully equipped learning zone where students can design, prototype and manufacture products. ‘Makerspaces’ are a fairly new phenomenon, but are beginning to make waves in the field of education. The SST Maker Lab represents the democratisation of design, engineering, fabrication and education, and empowers our students with the resources to unleash their creativity"
                view360_identifier = "Makers_Lab"
                
            case "Canteen":
                Place_name.text = "Canteen"
                Place_image.image = UIImage(named: "Canteen_1a")
                Place_description.text =
                "Canteen has a variety of healthy food and drinks available for the students from early in the morning to after school afternoon. This is where SST students usually hang out because our food is irresistible. "
                view360_identifier = "Canteen"
                
            // Block D
            case "Field":
                Place_name.text = "School Field"
                Place_image.image = UIImage(named: "Field_1a")
                Place_description.text =
                "This area which is between the field and the cafe enables students to have a relaxing environment. CCA and external activities are sometimes held here. This is SST’s field where many activities are conducted from SNW classes to Orientation and camp. It is also where the football CCA conduct their trainings and matches. Students often play games here during their break times."
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
