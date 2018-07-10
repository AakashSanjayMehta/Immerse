//
//  ViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 15/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView

class ViewController: UIViewController {
    
    @IBOutlet weak var start_button: UIButton!
    @IBOutlet weak var Help_button: UIButton!
    @IBOutlet weak var Credits_button: UIButton!
    @IBOutlet weak var AR_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // round button corner
        start_button.clipsToBounds = true
        Help_button.clipsToBounds = true
        Credits_button.clipsToBounds = true
        AR_button.clipsToBounds = true
        start_button.layer.cornerRadius = 10
        Help_button.layer.cornerRadius = 10
        Credits_button.layer.cornerRadius = 10
        AR_button.layer.cornerRadius = 10
        
         AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    


}
