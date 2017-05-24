//
//  YLViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLViewController: UIViewController {

    var titleView : UIView?
    var titleLabel : UILabel?
    var leftBtn : UIButton?
    var rightBtn : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTitleView()
        
    }
    
    func loadTitleView() {
        titleView = UIView()
        titleView?.backgroundColor = .blue
        self.view.addSubview(titleView!)
        titleView!.snp.makeConstraints { (make) -> Void in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(64)
        }
        
        titleLabel = UILabel()
//        titleLabel?.text = "标题abc"
        titleLabel?.font = RHFont
        titleLabel?.textColor = .white
        titleView!.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(titleView!)
            make.bottom.equalTo(-10)
        })
    }
    
}
