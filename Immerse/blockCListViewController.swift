//
//  blockCListViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 16/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

/*
 blockCPlace is a list of the places recorded in this app, that is in SST block C
 */
public let blockCPlace = ["SST_Inc", "Robotics@apex", "S1S3_clasrooms", "Biotech_Lab", "Makers'_Lab", "Canteen"]

class blockCListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /*
     Returns the number of items in the list blockCPlace
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blockCPlace.count
    }

    /*
     Cell text is allocated to each cell based on the index of BlockCPlace
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! blockCTableViewCell
        
        switch blockCPlace[indexPath.row] {
            
        case "SST_Inc":
            cell.Preview_Image.image = UIImage(named: "Inc_1a")
            cell.place_name.text = "   SST Inc."
            
        case "Robotics@apex": // NOT DONE
            cell.Preview_Image.image = UIImage(named: "")
            cell.place_name.text = "   Robotics @ apex"
            
        case "S1S3_clasrooms":
            cell.Preview_Image.image = UIImage(named: "L4Class_1a")
            cell.place_name.text = "   Level 4 Clasrooms"
            
        case "Biotech_Lab":
            cell.Preview_Image.image = UIImage(named: "BiotechLab_1a")
            cell.place_name.text = "   Biotech Lab"
            
        case "Makers'_Lab":
            cell.Preview_Image.image = UIImage(named: "MakerLab_1a")
            cell.place_name.text = "   Makers' Lab"
            
        case "Canteen":
            cell.Preview_Image.image = UIImage(named: "Canteen_1a")
            cell.place_name.text = "   Canteen"
            
        default:
            break
        }
        
        cell.Preview_Image.layer.cornerRadius = 25
        cell.place_name.layer.cornerRadius = 20
        
        return (cell)
    }
    
    /*
     Animating the Cell
 
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
    
    
    
    
    /*
     When a cell is selected (Based on Number) it will move on to the next vc
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UserDefaults.standard.set(blockCPlace[indexPath.row], forKey: "place name")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    /*
     The height of the cell will get big
    */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 328
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
