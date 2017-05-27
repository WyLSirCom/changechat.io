//
//  YLLeftTextTableViewCell.swift
//  ChangChat
//
//  Created by wyl on 2017/5/27.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLLeftTextTableViewCell: UITableViewCell {

    var timelabel : UILabel?
    var headerImageBtn : UIButton?
    var contentTextBtn : UIButton?
    var contentImageBtn : UIButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        loadUI()
        btn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btn() {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.numberOfLines = 0
                btn.titleLabel?.snp.makeConstraints({ (make) in
                    make.edges.equalTo(btn)
                })
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//        btn.sizeToFit()
//        btn.titleLabel?.adjustsFontSizeToFitWidth = true
    btn.setTitle("kahfjkhajfhjkahfjkahfjkhfafhajkjkhasjkdfhksdhfjhfj", for: .normal)
        btn.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)

        btn.backgroundColor = .red
        self.addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
//            make.right.equalTo(-10)
            make.width.equalTo(100)
            make.bottom.equalTo(-10)
            
        }
//        btn.titleLabel?.snp.makeConstraints({ (make) in
//            make.edges.equalTo(btn)
//        })
    }
    
    
    func loadUI() {
        timelabel = UILabel()
        timelabel?.backgroundColor = .orange
        self.contentView.addSubview(timelabel!)
        timelabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(5)
            make.height.equalTo(10)
            make.width.equalTo(ScreenWidth)
        })
        
        headerImageBtn = UIButton()
        headerImageBtn?.backgroundColor = .blue
        self.contentView.addSubview(headerImageBtn!)
        headerImageBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(10)
            make.top.equalTo((timelabel?.snp.bottom)!).offset(10)
            make.width.height.equalTo(60)
        })
        headerImageBtn?.layer.cornerRadius = 30
        headerImageBtn?.layer.masksToBounds = true
        
        
//        let la = UILabel()
//        la.backgroundColor = .red
//        la.text = "你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好"
//        la.numberOfLines = 0
//        self.contentView.addSubview(la)
//        la.snp.makeConstraints { (make) in
//            make.top.equalTo((headerImageBtn?.snp.top)!)
//            make.left.equalTo((headerImageBtn?.snp.right)!).offset(10)
//            make.right.equalTo(-50)
//            make.bottom.equalTo(-10)
//        }
        
        contentTextBtn = UIButton(type: .custom)
        contentTextBtn?.titleLabel?.numberOfLines = 0
        
        contentTextBtn?.setTitle("你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好", for: .normal)
        contentTextBtn?.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        contentTextBtn?.backgroundColor = .red
        self.contentView.addSubview(contentTextBtn!)
        contentTextBtn?.snp.makeConstraints { (make) in
            make.top.equalTo((headerImageBtn?.snp.top)!)
            make.left.equalTo((headerImageBtn?.snp.right)!).offset(10)
            make.right.equalTo(-50)
            make.bottom.equalTo(-10)
//            make.height.equalTo(200)
        }
 
        
    }
    
    func setFrame() {
        
    }

}
