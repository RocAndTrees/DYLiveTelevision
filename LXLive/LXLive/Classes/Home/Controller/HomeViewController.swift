//
//  HomeViewController.swift
//  LXLive
//
//  Created by pxl on 2017/1/18.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    
        
        // Do any additional setup after loading the view.
    }

 
}
extension HomeViewController{
    public func setupUI(){
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        let size = CGSize(width: 40, height: 40)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageNormal: #imageLiteral(resourceName: "logo"))
        
        let historyItem = UIBarButtonItem(imageNormal: #imageLiteral(resourceName: "image_my_history"), imageHigh: #imageLiteral(resourceName: "Image_my_history_click"), size: size)
        
        let searchItem = UIBarButtonItem(imageNormal: #imageLiteral(resourceName: "btn_search"), imageHigh: #imageLiteral(resourceName: "btn_search_clicked"), size: size)

        let qrcodeItem = UIBarButtonItem(imageNormal: #imageLiteral(resourceName: "Image_scan"), imageHigh: #imageLiteral(resourceName: "Image_scan_click"), size: size)

        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
    }
}
