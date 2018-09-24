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
let blockCPlace = ["Atheletics", "Badminton", "Basketball", "Fencing", "Floorball", "Football", "Taekwondoe", "English Drama Club", "Guitar Ensemble", "Show Choir", "Astronomy Club", "Media Club", "Robotics@APEX", "Singapore Youth Flying Club", "Scouts"]

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
        cell.place_name.text = blockCPlace[indexPath.row]
        switch blockCPlace[indexPath.row] {

        

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

    @IBAction func toARC(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ARSkewl")
        self.present(vc, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
