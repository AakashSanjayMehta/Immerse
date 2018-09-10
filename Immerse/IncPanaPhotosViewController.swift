//
//  PanaPhotosViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 16/5/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import AVFoundation

class PanaPhotosViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var player: AVAudioPlayer!

    // page control start
    var pageControl = UIPageControl()

    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = pages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.gray
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = pages.index(of: pageContentViewController)!
    }

    // page control end

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            // return pages.last
            return nil
        }

        guard pages.count > previousIndex else {
            return nil
        }

        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex + 1

        guard previousIndex >= 0 else {
            // return pages.last
            return nil
        }

        guard pages.count > previousIndex else {
            return nil
        }

        return pages[previousIndex]


    }

    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "INC1A"),
            self.getViewController(withIdentifier: "INC1B"),
            self.getViewController(withIdentifier: "INC1C"),
            self.getViewController(withIdentifier: "INC1D")
        ]
    }()

    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }

    // dismiss button
    @objc func dismiss_btn(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }

        // Init dissmiss button
        let button = UIButton(frame: CGRect(x: 16, y: 32, width: 50, height: 50))
        button.backgroundColor = .white
        button.alpha = 0.5
        button.layer.cornerRadius = button.layer.frame.width / 2
        button.setImage(UIImage(named: "cross"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(dismiss_btn), for: .touchUpInside)

        self.view.addSubview(button)
        
        // MARK: Audio setup
        let audioButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 75, width: 75, height: 50))
        audioButton.backgroundColor = UIColor.black
        audioButton.layer.cornerRadius = button.layer.frame.height / 2
        
        audioButton.addTarget(self, action: #selector(playingpausing(_:)), for: .touchUpInside)
        
        self.view.addSubview(audioButton)
  
        guard let audiopath = Bundle.main.path(forResource: "SST INC", ofType: "m4a") else {
            print("error111")
            return
        }
        print(audiopath)

        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)

        try! player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audiopath) as URL)
        player?.prepareToPlay()

//        let playPause = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(PanaPhotosViewController.playingpausing(_:)))
//        navigationItem.rightBarButtonItem = playPause

        configurePageControl()
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
