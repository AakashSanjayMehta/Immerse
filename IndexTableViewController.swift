//
//  IndexTableViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 28/9/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class IndexTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var placesAndShit = ["Principal's Foreword", "Transformation in Action", "Vision, Values, Mission", "Partners", "Programmes", "Achievements", "P for SST", "Income Limits and Benefits", "Scholarships and Bursaries", "Open House 2018", "Facilities"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesAndShit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = placesAndShit[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: placesAndShit[indexPath.row])
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
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
