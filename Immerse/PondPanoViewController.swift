//
//  PondPanoViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import CTPanoramaView
import AVFoundation

class PondPanoViewController: UIViewController {
    
    var player:AVAudioPlayer?
    @IBOutlet var IPPondV: CTPanoramaView!
    
    // dismiss button
    @objc func dismiss_btn(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init dissmiss button
        let button = UIButton(frame: CGRect(x: 16, y: 26, width: 50, height: 50))
        button.backgroundColor = .white
        button.alpha = 0.5
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "cross"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(dismiss_btn), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        /////WRONG AUDIO
        guard let audiopath =  Bundle.main.path(forResource: "Infohub", ofType: "m4a") else{
            print("error111")
            return
        }
        print(audiopath)
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        try! player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audiopath) as URL)
        player?.prepareToPlay()
        
        let playPause = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(LibraryPanaViewController.playingpausing(_:)))
        navigationItem.rightBarButtonItem = playPause
    }
    
    override func viewDidAppear(_ animated: Bool) {
        IPPondV.controlMethod = .motion
        IPPondV.image = UIImage(named: "Pond_1a")
    }
    
    @objc func playingpausing(_ sender:UIBarButtonItem!){
        var new_button = UIBarButtonItem()
        if( player?.isPlaying )! {
            
            player?.pause()
            // Update the button
            new_button = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playingpausing(_:)))
        } else {
            
            player?.play();
            // Create the pause button
            new_button = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(playingpausing(_:)))
        }
        
        navigationItem.rightBarButtonItem = new_button
        
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
