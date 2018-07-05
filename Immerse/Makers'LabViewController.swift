//
//  Makers'LabViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView
import AVFoundation

class Makers_LabViewController: UIViewController {
    var player:AVAudioPlayer?
    @IBOutlet var IPmakersLabV: CTPanoramaView!
    override func viewDidLoad() {
        super.viewDidLoad()
        IPmakersLabV.controlMethod = .motion
        IPmakersLabV.image = UIImage(named: "MakerLab_1a")
        
        guard let audiopath =  Bundle.main.path(forResource: "Cafe", ofType: "m4a") else{
            print("error111")
            return
        }
        print(audiopath)
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        try! player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audiopath) as URL)
        player?.prepareToPlay()
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
