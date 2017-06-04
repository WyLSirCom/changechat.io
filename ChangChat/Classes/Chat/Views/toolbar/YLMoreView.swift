//
//  YLMoreView.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/1.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLMoreView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        let emojiView = YLEmojiView()
        self.addSubview(emojiView)
        emojiView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }

}
