//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by 1 on 16/9/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    // MARK: 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: 定义模型属性
    var group : AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            guard let iconURL = URL(string: (group?.icon_url)!)  else {
                iconImageView.image = #imageLiteral(resourceName: "home_more_btn")
                return
            }
//            let iconURL = URL(urlString)
//            let iconURL = URL(string: group?.icon_url) else {return}
            iconImageView.kf.setImage(with: iconURL, placeholder: #imageLiteral(resourceName: "home_more_btn"))
        }
    }
}
