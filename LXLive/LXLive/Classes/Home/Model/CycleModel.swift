//
//  CycleModel.swift
//  LXLive
//
//  Created by pxl on 2017/2/9.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    var title : String = ""
    
    var pic_url : String = ""
    
    var room : [String : NSObject]? {
        didSet{
            guard let room = room else {return }
                anchor = AnchorModel(dict: room)
        }
    }
    
    var anchor : AnchorModel?
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
