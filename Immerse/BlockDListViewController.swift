//
//  BlockDListViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class BlockDListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    public let blockDPlace = ["ICT", "Media", "Dance", "Math", "Science", "English", "Humanities", "ADMT"]

    /*
     Returns the number of items in the list blockDPlace
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blockDPlace.count
    }

    /*
     Cell text is allocated to each cell based on the index of BlockCPlace
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! blockDTableViewCell
        cell.place_name.text = blockDPlace[indexPath.row]
        switch blockDPlace[indexPath.row] {


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

        UserDefaults.standard.set(blockDPlace[indexPath.row], forKey: "place name")

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
