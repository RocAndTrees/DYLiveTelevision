//
//  AmuseViewModel.swift
//  LXLive
//
//  Created by pxl on 2017/2/15.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class AmuseViewModel: BaseViewModel{

}


extension AmuseViewModel{
    func loadAmuseData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
        
    }

}
