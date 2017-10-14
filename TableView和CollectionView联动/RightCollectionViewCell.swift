//
//  RightCollectionViewCell.swift
//  LiWuShuo
//
//  Created by Youcai on 2017/4/19.
//  Copyright © 2017年 mm. All rights reserved.
//

import UIKit
import SDWebImage
class RightCollectionViewCell: UICollectionViewCell {
    var data:Subcategories? {
        didSet {
          iconView.sd_setImage(with: URL.init(string: (data?.icon_url)!))
            nameLabel.text = data?.name
        }
    }
     // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     // MARK: - setUI
    func setUI()  {
        contentView.addSubview(iconView)
        contentView.addSubview(nameLabel)
        iconView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { (make) in
           make.top.equalTo(iconView.snp.bottom)
           make.left.right.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        
    }
    // MARK: - Lazy
    private lazy var iconView:UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    private lazy var nameLabel:UILabel = {
        let view = UILabel()
        view.font = Font(fontSize: 12)
        view.textAlignment = .center
        
        return view
    }()
}
