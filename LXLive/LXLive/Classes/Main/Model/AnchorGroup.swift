
//
//  AnchorGroup.swift
//  LXLive
//
//  Created by pxl on 2017/2/7.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class AnchorGroup: BaseGameModel {
    var room_list : [[String : NSObject]]? {
        didSet{
            guard let room_list = room_list else {return}
            for dict in room_list{
                anchors.append(AnchorModel(dict: dict))
            }

        }
    }
    
    
    var icon_name : String = "home_header_normal"
    //定义主播的模型对象数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
 }
