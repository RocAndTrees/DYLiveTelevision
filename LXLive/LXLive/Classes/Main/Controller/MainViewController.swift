//
//  MainViewController.swift
//  LXLive
//
//  Created by pxl on 2017/1/18.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        addChildVc("Home")
        addChildVc("Live")
        addChildVc("Follow")
        addChildVc("Profile")
        
        
    }

    private func addChildVc(_ storyName: String){
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVc)
    }

}
