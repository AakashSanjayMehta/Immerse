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
public let blockCPlace = ["SST Inc.", "Robotics @ apex", "Sec 1 and 3 clasrooms", "Biotechnology Lab", "Makers' Lab", "Canteen"]


class viewcell: UITableViewCell {
    
}

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
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = blockCPlace[indexPath.row]
        
        return (cell)
    }
    
    /*
     Animating the Cell
    */
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
    
    
    
    
    
    
    /*
     When a cell is selected (Based on Number) it will move on to the next vc
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.row) {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PVC")
            self.navigationController!.pushViewController(vc!, animated: true)
            break
            
        case 1:
            let alertController = UIAlertController(title: "Still in progress", message: "This image has not been implemented yet. We apologize for the inconvenience.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            break
            
        case 2:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "13A")
            self.navigationController!.pushViewController(vc!, animated: true)
            break
            
        case 3:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BLV")
            self.navigationController!.pushViewController(vc!, animated: true)
            break
            
        case 4:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MLV")
            self.navigationController!.pushViewController(vc!, animated: true)
            break
            
        case 5:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CANVC")
            self.navigationController!.pushViewController(vc!, animated: true)
            break
            
        default:
            break
        }
        
    }
    
    /*
     The height of the cell will get big
    */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 485
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
