//
//  RecommendViewController.swift
//  LXLive
//
//  Created by pxl on 2017/2/3.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit
import Alamofire


private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90




class RecommendViewController: BaseAnchorViewController {

    
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    
    fileprivate lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    fileprivate lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
}

//MARK: -- UI界面内容设置
extension RecommendViewController{
    
    override func setupUI(){
        // 1.将UICollectionView添加到控制器的View中
        
        super.setupUI()
        
//        view.addSubview(collectionView)
        
        // 2.将CycleView添加到UICollectionView中
        collectionView.addSubview(cycleView)

        //3.将gameView添加到UICollectionView
        collectionView.addSubview(gameView)
        
        // 4.设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)

    }
    
    
}

// MARK:- 请求数据
extension RecommendViewController {
    override func loadData() {
        // 0.给父类中的ViewModel进行赋值
        baseVM = recommendVM

        // 1.请求推荐数据
        recommendVM.requestData {
            // 1.展示推荐数据
            self.collectionView.reloadData()
            
            // 2.将数据传递给GameView
            var groups = self.recommendVM.anchorGroups
            
            // 2.1.移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            
            // 2.2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups
            
            // 3.数据请求完成
            self.loadDataFinished()
        }
        
        // 2.请求轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
        
        
    }
}



//MARK: -- CollectionView 数据
extension RecommendViewController : UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            // 1.取出PrettyCell
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            
            // 2.设置数据
            prettyCell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return prettyCell
        } else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }
        
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
    
    
}







