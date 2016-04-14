//
//  OneViewController.swift
//  UIPageViewController
//
//  Created by 姚驷旭 on 16/4/14.
//  Copyright © 2016年 姚驷旭. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    var titleText : String = ""
    var imageFile : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        
        self.view.backgroundColor = UIColor ( red: 1.0, green: 0.1062, blue: 0.248, alpha: 1.0 )
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        imageView.image = UIImage(named: imageFile)
        view.addSubview(imageView)
        
        let button = UIButton()
        button.frame = CGRectMake(20, view.frame.height - 110, view.frame.width - 40, 50)
        button.backgroundColor = UIColor(red: 138/255.0, green: 181/255.0, blue: 91/255.0, alpha: 1)
        button.setTitle(titleText, forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(OneViewController.Action), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Action() {
        print("\(#function)")
    }
    
}
