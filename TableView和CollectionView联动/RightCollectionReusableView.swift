//
//  RightCollectionReusableView.swift
//  LiWuShuo
//
//  Created by Youcai on 2017/4/19.
//  Copyright © 2017年 mm. All rights reserved.
//

import UIKit

class RightCollectionReusableView: UICollectionReusableView {
    var name:String? {
        didSet {
           nameLabel.text = " " + name! + " "
        }
    }
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = WHITE_COLOR
        addSubview(line)
        addSubview(nameLabel)
        line.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(0.5)
            make.left.equalTo(self.snp.left).offset(5)
            make.right.equalTo(self.snp.right).offset(-5)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.centerX.equalTo(line)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // MARK: - Lazy
    private lazy var line:UIView = {
        let view = UIView()
        view.backgroundColor = RGB(r: 100, g: 100, b: 100)
        return view
    }()
    private lazy var nameLabel:UILabel = {
        let view = UILabel()
        view.font = Font(fontSize: 12)
       // view.textAlignment = .center
        view.backgroundColor = WHITE_COLOR
        return view
    }()
}
