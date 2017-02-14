




//
//  GameViewModel.swift
//  LXLive
//
//  Created by pxl on 2017/2/13.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class GameViewModel: NSObject {
    lazy var games : [GameModel] = [GameModel]()
}


extension GameViewModel {
    func loadAllGameData(finishedCallback:@escaping () -> ()){
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters:     ["shortName" : "game"]) { (result) in
                //1. 获取数据
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String: Any]] else {return}
                //2.字典转模型
            for dict in dataArray{
                self.games.append(GameModel(dict: dict))
            }
            
            finishedCallback()
                 
        }
    }
    
    
}
