//
//  YLToolBarView.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/1.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLToolBarView: UIView,UITextViewDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = randColor(r: 243, g: 240, b: 241, a: 1.0)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        
        let textView = UITextView()
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.isScrollEnabled = false
        self.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        adjustTextView(textView: textView)
    }
    
    // 处理输入文字时键盘的高度变化
    func adjustTextView(textView : UITextView) {
        let maxheight : CGFloat = 95
        let frame = textView.frame
        log.debug(frame)
        
        let constrainSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let size = textView.sizeThatFits(constrainSize)
        if size.height > maxheight {
            textView.isScrollEnabled = true
            return
        } else {
            textView.isScrollEnabled = false
            if frame.size.height > size.height {
                log.debug("减小")
                self.snp.updateConstraints({ (make) in
                    make.height.equalTo(20 + size.height)
                })
            } else if (frame.size.height < size.height) {
                log.debug("增大")
                self.snp.updateConstraints({ (make) in
                    make.height.equalTo(20 + size.height)
                })
            }
            
        }
    }

}
