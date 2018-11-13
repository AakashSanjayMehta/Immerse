//
//  CCACategoriesOptionsViewController.swift
//  Immerse
//
//  Created by Ben Woo on 13/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class CCACategoriesOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let CatogoriesOptions = ["Sports & Games", "Performing Arts", "Clubs & Societies", "Uniform Group"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CatogoriesOptions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 131
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CCACategoriesOptionsTableViewCell
        
        tableView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.Label.layer.cornerRadius = 20
        cell.Label.text = CatogoriesOptions[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UserDefaults.standard.set(CatogoriesOptions[indexPath.row], forKey: "selectedCatergory")
    }
    
}
