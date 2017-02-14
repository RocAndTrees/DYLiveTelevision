
//
//  BaseGameModel.swift
//  LXLive
//
//  Created by pxl on 2017/2/13.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class BaseGameModel: NSObject {
    // Mark: -- 定义属性
    var tag_name : String = ""
    var icon_url : String = ""
    
    //MARK: -- 自定义构造函数
    override init() {
        
    }
    
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
