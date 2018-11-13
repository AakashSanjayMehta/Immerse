//
//  CCAMainViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 12/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class CCAMainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var Next_btn: UIButton!
    
    // MARK - Information
    var text = [
    "One of the early milestones you would face as an SST student is chosing a CCA. Since the cohort is a small one, we are told that the school will start new CCAs only if there is a sizeable number of interested students. But the truth is that our students have no problems finding a CCA that either helps to hone current skills and interests or uncover a hidden talent or passion. ",
    
    "During the CCA tryouts, students are given the opportunity to attend any CCA session of their choice during a two-week trial period. Following the trial period, students would then indicate their preferred choice of CCA for the rest of their 4 years in SST. ",
    
    "I had a hard time choosing but eventually went with my heart in choosing showchoir. Showchoir is a performings arts CCA in SST. Other categories are Sports and Games, Clubs and Societies and Uniform groups. ",
    
    "I had seen clips of my seniors performing and was in awe.😲I’m finding out that getting to those standards of performance took a lot of effort and practice, not to mention team work. But as they say,”No pain, no gain.”. I want to gain the confidence to express myself and the strength to endure tough situations. So I’ll break a leg, not literally of course. 😄"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Next_btn.layer.cornerRadius = Next_btn.frame.height / 2

        // MARK - pageView Setup
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        pageControl.numberOfPages = text.count
        for index in 0..<text.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index) + 5
            frame.size.width = scrollView.frame.size.width - 10
            frame.size.height = scrollView.frame.size.height - 10
            
            let textView = UITextView(frame: frame)
            textView.text = text[index]
            textView.font = UIFont(name: textView.font!.fontName, size: 20)
            textView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            textView.isEditable = false
            textView.clipsToBounds = true
            textView.layer.cornerRadius = 10
            
            self.scrollView.addSubview(textView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(text.count)), height: scrollView.frame.height)
        
        scrollView.delegate = self
    }
    
    // MARK - Scrollview Method
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}


