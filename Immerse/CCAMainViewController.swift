//
//  CCAMainViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 12/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class CCAMainViewController: UIViewController {

    @IBOutlet weak var CCAContainerView: UIView!
    @IBOutlet weak var CCAPVCPageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let CCApageVC = segue.destination as? CCAPageViewController {
            CCApageVC.CCAPageVCDelegate = self
        }
    }
    

}

extension CCAMainViewController: CCAPageViewControllerDelegate{
    func CCAPageViewController(CCAPageVC: CCAPageViewController, didUpdatePageCount count: Int) {
        CCAPVCPageControl.numberOfPages = count
    }
    
    func CCAPageViewController(CCAPageVC: CCAPageViewController, didUpdatePageIndex index: Int) {
        CCAPVCPageControl.currentPage = index
    }
}
