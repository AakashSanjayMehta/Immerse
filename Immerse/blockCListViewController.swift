//
//  blockCListViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 16/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class blockCListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let blockCPlace = ["SST Inc.", "Robotics @ apex", "Sec 1 and 3 clasrooms", "Biotechnology Lab", "Makers' Lab", "Canteen"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blockCPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = blockCPlace[indexPath.row]
        
        return (cell)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.row) {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PVC")
            self.navigationController!.pushViewController(vc!, animated: true)
            break
            
        case 1:
            
            break
        case 2:
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
