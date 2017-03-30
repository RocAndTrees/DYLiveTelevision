//
//  BaseViewModel.swift
//  LXLive
//
//  Created by pxl on 2017/2/15.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class BaseViewModel: NSObject {
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()

}

extension BaseViewModel{
    func loadAnchorData(URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping () -> ()) {
        NetWorkTools.requestData(.get, URLString: URLString, parameters: parameters as! [String : String]?) { (result) in
            // 1.对界面进行处理
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            // 2.遍历数组中的字典
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }
            
            // 3.完成回调
            finishedCallback()
        }
    }

}
