//
//  YLLoginTextField.swift
//  ChangChat
//
//  Created by wyl on 2017/5/26.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import Spring

class YLLoginTextField: SpringView{

    var textFiled : UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadTextFiled()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadTextFiled() {
        textFiled = UITextField()
        self.addSubview(textFiled!)
        textFiled?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(0)
            make.bottom.equalTo(-1)
        })
        
        let lineview = UIView()
        self.addSubview(lineview)
        lineview.backgroundColor = UIColor.lightGray
        lineview.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(1)
        }
    }
    
    func setplaceholder(placeholder : String) {
        textFiled?.placeholder = placeholder
    }
    
    
}
