//
//  CCAViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 12/11/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit

class CCAPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    func AddVCtoPVC(ID: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CCAVC\(ID)")
        
    }
    
    let CCAVCs: [UIViewController] = [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CCAVC1"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CCAVC2"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CCAVC3"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CCAVC4")]
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = CCAVCs.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard CCAVCs.count > previousIndex else{return nil}
        return CCAVCs[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = CCAVCs.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = CCAVCs.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return CCAVCs[nextIndex]
    }
    
    weak var CCAPageVCDelegate: CCAPageViewControllerDelegate?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self as UIPageViewControllerDataSource
        delegate = self as? UIPageViewControllerDelegate
        if let firstVC = CCAVCs.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        CCAPageVCDelegate?.CCAPageViewController(CCAPageVC: self, didUpdatePageCount: CCAVCs.count)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}

extension CCAPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
            let index = CCAVCs.index(of: firstViewController) {
            CCAPageVCDelegate?.CCAPageViewController(CCAPageVC: self, didUpdatePageCount: index)
        }
    }
    
}

protocol CCAPageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func CCAPageViewController(CCAPageVC: CCAPageViewController,
                                    didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func CCAPageViewController(CCAPageVC: CCAPageViewController,
                                    didUpdatePageIndex index: Int)
    
}
