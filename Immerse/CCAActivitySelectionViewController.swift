//
//  CCAActivitySelectionViewController.swift
//  Immerse
//
//  Created by Ben Woo on 13/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class CCAActivitySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let Activities:[String:[String]] = [
        "Sports & Games": ["Athletics", "Badminton", "Basketball", "Fencing", "Floorball", "Taekwondo"],
        "Performing Arts": ["English Drama", "Guitar Ensemble", "Showchoir"],
        "Clubs & Societies": ["Astronomy Club", "Media Club", "Robotics @ Apex", "Sinagpore Youth Flying Club"],
        "Uniform Group": ["Air Scouts"]]
    
    var selectedCatergory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        selectedCatergory = UserDefaults.standard.string(forKey: "selectedCatergory")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Activities[selectedCatergory!]?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 131
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CCAActivitySelectionTableViewCell
        
        tableView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.Label.layer.cornerRadius = 20
        cell.Label.text = Activities[selectedCatergory!]?[indexPath.row]
        
        return cell
    }

}
