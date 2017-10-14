//
//  LeftTableViewCell.swift
//  LiWuShuo
//
//  Created by Youcai on 2017/4/19.
//  Copyright © 2017年 mm. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {
    var name:String? {
        didSet {
          nameLabel.text = name
        }
    }
    // MARK: -  init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     // MARK: - setUI
    func setUI()  {
        contentView.addSubview(nameLabel)
        contentView.addSubview(leftView)
         leftView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(contentView)
            make.width.equalTo(2)
            make.left.equalTo(contentView.snp.left)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(contentView)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.backgroundColor = selected ? UIColor.white : UIColor(white: 0, alpha: 0.1)
          nameLabel.isHighlighted = selected
          leftView.isHidden = !selected
        
    }
     // MARK: - Lazy
    private lazy var nameLabel:UILabel = {
        let view = UILabel()
        view.font = Font(fontSize: 14)
        view.textColor = BLACK_COLOR
        view.highlightedTextColor = RED_COLOR
        return view
    }()
    private lazy var leftView:UIView = {
        let view = UIView()
        view.backgroundColor = RED_COLOR
        
        return view
    }()
}
