//
//  CanteenViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView
import AVFoundation

//NOT PART OF CAFE PAGE PANO
class CanteenViewController: UIViewController {

    @IBOutlet var IPCanteenV: CTPanoramaView!
    var player: AVAudioPlayer?

    // dismiss button
    @objc func dismiss_btn(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        IPCanteenV.controlMethod = .motion
        IPCanteenV.image = UIImage(named: "Canteen_1a")

        // Init dissmiss button
        let button = UIButton(frame: CGRect(x: 16, y: 32, width: 50, height: 50))
        button.backgroundColor = .white
        button.alpha = 0.5
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "cross"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(dismiss_btn), for: .touchUpInside)

        self.view.addSubview(button)
        
        // MARK: Audio setup
        let audioButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 75, width: 75, height: 50))
        audioButton.backgroundColor = UIColor.black
        audioButton.layer.cornerRadius = button.layer.frame.height / 2
        
        audioButton.addTarget(self, action: #selector(playingpausing(_:)), for: .touchUpInside)
        
        self.view.addSubview(audioButton)
        
        guard let audiopath = Bundle.main.path(forResource: "Canteen", ofType: "m4a") else {
            print("error111")
            return
        }
        print(audiopath)
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        try! player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audiopath) as URL)
        player?.prepareToPlay()
        
    }

    @objc func playingpausing(_ sender: UIBarButtonItem!) {
        
        if (player?.isPlaying)! {
            
            player?.pause()
            // Update the button
            
        } else { player?.play() }
        
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
