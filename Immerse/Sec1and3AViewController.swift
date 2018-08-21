//
//  Sec1and3AViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView
import AVFoundation

class Sec1and3AViewController: UIViewController {

    @IBOutlet var IP13aV: CTPanoramaView!
    
    // dismiss button
    @objc func dismiss_btn(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initailzing the pictures
        IP13aV.controlMethod = .motion
        IP13aV.image = UIImage(named: "L4Class_1a")
        
        // Init dissmiss button
        let button = UIButton(frame: CGRect(x: 16, y: 26, width: 50, height: 50))
        button.backgroundColor = .white
        button.alpha = 0.5
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "cross"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(dismiss_btn), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        //audio for sec 1 and 3 classrooms
        
        //buttons for audio
        
        
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
