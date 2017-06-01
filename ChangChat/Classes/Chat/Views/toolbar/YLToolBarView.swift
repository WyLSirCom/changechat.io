//
//  YLToolBarView.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/1.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLToolBarView: UIView,UITextViewDelegate {

    var moreview : YLMoreView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = randColor(r: 243, g: 240, b: 241, a: 1.0)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        
        let talkBtn = UIButton()
        talkBtn.backgroundColor = .red
        self.addSubview(talkBtn)
        talkBtn.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.height.equalTo(34)
        }
        
        let moreBtn = UIButton()
        moreBtn.backgroundColor = .red
        self.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.bottom.equalTo(talkBtn.snp.bottom)
            make.height.width.equalTo(talkBtn.snp.width)
        }
        moreBtn.addTarget(self, action: #selector(moreBtnClick(sender:)), for: .touchUpInside)
        
        let emojiBtn = UIButton()
        emojiBtn.backgroundColor = .red
        self.addSubview(emojiBtn)
        emojiBtn.snp.makeConstraints { (make) in
            make.right.equalTo(moreBtn.snp.left).offset(-10)
            make.bottom.equalTo(talkBtn.snp.bottom)
            make.height.width.equalTo(talkBtn.snp.width)
        }
        emojiBtn.addTarget(self, action: #selector(emojiBtnClick(sender:)), for: .touchUpInside)
        
        let textView = UITextView()
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        textView.isScrollEnabled = false
        self.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(talkBtn.snp.right).offset(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(emojiBtn.snp.left).offset(-10)
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
                UIView.animate(withDuration: 0.25, animations: {
                    self.snp.updateConstraints({ (make) in
                        make.height.equalTo(20 + size.height)
                    })
                    self.superview?.layoutIfNeeded()
                })
            } else if (frame.size.height < size.height) {
                log.debug("增大")
                UIView.animate(withDuration: 0.25, animations: {
                    self.snp.updateConstraints({ (make) in
                        make.height.equalTo(20 + size.height)
                    })
                    self.superview?.layoutIfNeeded()
                })
            }
            
        }
    }
    
    //右侧两个按钮的事件
    func emojiBtnClick(sender : UIButton) {
        
    }
    
    func moreBtnClick(sender : UIButton) {
        moreview = YLMoreView(frame: CGRect(x: 0, y: 500, width: ScreenWidth, height: ScreenHeight - 500))
//        self.superview?.addSubview(self.moreview!)
        self.addSubview(self.moreview!)
        transition(type: "push", subtype: kCATransitionFromTop, view: moreview!)
        UIView.animate(withDuration: 0.5) {
            self.snp.updateConstraints { (make) in
                make.bottom.equalTo(500-ScreenHeight)
            }
            self.superview?.layoutIfNeeded()
        }
        
    }

}
