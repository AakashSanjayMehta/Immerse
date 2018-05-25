//
//  blockAViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class blockAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let blockAPlace = ["Library", "General Office", "Eletronic Labs"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blockAPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = blockAPlace[indexPath.row]
        
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.row) {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LIBVIEW")
            self.navigationController!.pushViewController(vc!, animated: true)
            break
        case 1:
            let alertController = UIAlertController(title: "Still in progress", message: "This image has not been implemented yet. We apologize for the inconvenience.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            break
        case 2:
            let alertController = UIAlertController(title: "Still in progress", message: "This image has not been implemented yet. We apologize for the inconvenience.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
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
