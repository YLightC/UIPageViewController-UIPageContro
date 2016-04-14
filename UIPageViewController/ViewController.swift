//
//  ViewController.swift
//  UIPageViewController
//
//  Created by 姚驷旭 on 16/4/14.
//  Copyright © 2016年 姚驷旭. All rights reserved.
//

import UIKit

class TSPageViewController: UIPageViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.automaticallyAdjustsScrollViewInsets = false
        let subViews: NSArray = view.subviews
        var scrollView: UIScrollView? = nil
        var pageControl: UIPageControl? = nil
        
        for view in subViews {
            if view.isKindOfClass(UIScrollView) {
                scrollView = view as? UIScrollView
            }
            else if view.isKindOfClass(UIPageControl) {
                pageControl = view as? UIPageControl
            }
        }
        
        if (scrollView != nil && pageControl != nil) {
            print("view.bounds = \(view.bounds)")
            scrollView?.frame = view.bounds
            pageControl!.currentPageIndicatorTintColor = UIColor ( red: 0.698, green: 0.0941, blue: 0.5373, alpha: 1.0 )
            view.bringSubviewToFront(pageControl!)
        }
    }
}



class ViewController: UIViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageViewController : UIPageViewController?
    var pageTitles = ["1","2","3"]
    var pageImages = ["bg-1","bg-2","bg-3"]
    var viewControllers = [OneViewController(),OneViewController(),OneViewController()]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarHidden = true
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor ( red: 0.2437, green: 0.0483, blue: 1.0, alpha: 1.0 )
        initViewControllers()
        pageViewController = TSPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController?.dataSource = self
        pageViewController?.setViewControllers([viewControllers[0]] , direction: .Forward, animated: true, completion: nil)
        pageViewController?.view.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width,UIScreen.mainScreen().bounds.height)
        
        pageViewController?.view.backgroundColor = UIColor.orangeColor()
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        for views in (pageViewController?.view.subviews)! {
            if views.isKindOfClass(UIScrollView) {
                print("views.bounds = \(views.bounds)")
                views.bounds = CGRect(x: 375, y: 0, width: 375, height: 667)
            }
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        for views in (pageViewController.view.subviews) {
            if views.isKindOfClass(UIPageControl) {
                views.hidden = false
                break
            }
        }
        
        guard let index = viewControllers.indexOf(viewController as!  OneViewController) else {
            return nil
        }
        
        if index == 0 {
            return nil
        }
        return viewControllers[index - 1]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        for views in (pageViewController.view.subviews) {
            if views.isKindOfClass(UIPageControl) {
                views.hidden = true
                break
            }
        }
        
        guard let index = viewControllers.indexOf(viewController as! OneViewController) else {
            return nil
        }
        if (index + 1) == viewControllers.count {
            return nil
        }
        return viewControllers[index + 1]
    }
    
    func initViewControllers() {
        var i = 0
        viewControllers.forEach({
            $0.imageFile = pageImages[i]
            $0.titleText = pageTitles[i]
            i += 1
        })
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        print("\(#function)")
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        print("\(#function)")
        return 0
    }    
}