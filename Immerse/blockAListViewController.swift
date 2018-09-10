//
//  blockAViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

let blockAPlace = ["Library", "Cafe", "Pond", "SST_Inc", /*"Robotics@apex", */"S1S3_clasrooms", "Biotech_Lab", "Makers'_Lab", "Canteen", "Field"/*, "General_Office", "Eletronic_Labs"*/]

class blockAListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blockAPlace.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! blockATableViewCell

        switch blockAPlace[indexPath.row] {

        case "Library":
            cell.Preview_Image.image = UIImage(named: "Library_1a")
            cell.place_name.text = "   Library"
            break

        case "General_Office": // NOT DONE
            cell.Preview_Image.image = UIImage(named: "")
            cell.place_name.text = "   General Office"
            break

        case "Eletronic_Labs":
            cell.Preview_Image.image = UIImage(named: "")
            cell.place_name.text = "   Eletronic Labs"
            break
        
        case "Cafe":
            cell.Preview_Image.image = UIImage(named: "Cafe_1a")
            cell.place_name.text = "   Cafe"
            break
            
        case "Pond":
            cell.Preview_Image.image = UIImage(named: "Pond_1a")
            cell.place_name.text = "   Pond"
            break
            
        case "SST_Inc":
            cell.Preview_Image.image = UIImage(named: "Inc_1a")
            cell.place_name.text = "   SST Inc."
            break
            
        case "Robotics@apex": // NOT DONE
            cell.Preview_Image.image = UIImage(named: "")
            cell.place_name.text = "   Robotics @ apex"
            break
            
        case "S1S3_clasrooms":
            cell.Preview_Image.image = UIImage(named: "L4Class_1a")
            cell.place_name.text = "   Level 4 Clasrooms"
            break
            
        case "Biotech_Lab":
            cell.Preview_Image.image = UIImage(named: "BiotechLab_1a")
            cell.place_name.text = "   Biotech Lab"
            break
            
        case "Makers'_Lab":
            cell.Preview_Image.image = UIImage(named: "MakerLab_1a")
            cell.place_name.text = "   Makers' Lab"
            break
            
            
        case "Canteen":
            cell.Preview_Image.image = UIImage(named: "Canteen_1a")
            cell.place_name.text = "   Canteen"
            break
            
        case "Field":
            cell.Preview_Image.image = UIImage(named: "Field_1a")
            cell.place_name.text = "   Field"
            break
            
        default:
            break
        }

        cell.Preview_Image.layer.cornerRadius = 25
        cell.place_name.layer.cornerRadius = 20

        return (cell)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(blockAPlace[indexPath.row], forKey: "place name")
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
     The height of the cell will get big
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 328
    }

    /*
    var tableCellShown = [Bool](repeating: false, count: blockCPlace.count)
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (tableCellShown[indexPath.row]) == false{
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
            cell.layer.transform = rotationTransform
            
            UIView.animate(withDuration: 1.0) {
                cell.layer.transform = CATransform3DIdentity
            }
            
            tableCellShown[indexPath.row] = true
        }
    }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toAR(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ARSkewl")
        self.present(vc, animated: true, completion: nil)
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
