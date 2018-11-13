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
    
    var pageControl = UIPageControl()
    
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
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finsihed: Bool, previousViewControllers: [UIViewController], transiotionCompleted completed:Bool)  {
        let pageContentviewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = CCAVCs.index(of: pageContentviewController)!
    }
    
    func configurePagControle() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = CCAVCs.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.blue
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self as UIPageViewControllerDataSource
        delegate = self as? UIPageViewControllerDelegate
        configurePagControle()
        if let firstVC = CCAVCs.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
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

