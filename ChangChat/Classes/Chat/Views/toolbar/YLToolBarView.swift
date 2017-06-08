//
//  YLToolBarView.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/1.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

enum KeyBoardDismissType {
    case None
    case Register
}

class YLToolBarView: UIView,UITextViewDelegate {

    let moreview = YLMoreView()
    let textView = UITextView()
    let topView = UIView()
    var keyboardHei: CGFloat = 0
    ///标记键盘下落的方式。 采取的动画可能不同
    var keyboarddismisstype : KeyBoardDismissType = .None
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = randColor(r: 243, g: 240, b: 241, a: 1.0)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewFrameChange(noti:)), name: .UIKeyboardWillChangeFrame, object: nil)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textViewFrameChange(noti:Notification) {
        if self.keyboarddismisstype == .Register {
            return
        }
        log.debug(noti.userInfo)
        let frame = noti.userInfo?["UIKeyboardFrameEndUserInfoKey"] as! CGRect
        let duration = noti.userInfo?["UIKeyboardAnimationDurationUserInfoKey"] as! CGFloat
        
        let topFrame = topView.frame;
        log.debug(topFrame)
        let hei = frame.origin.y
        self.keyboardHei = ScreenHeight - hei
        log.debug("height  \(ScreenHeight - hei + topFrame.size.height)")
        UIView.animate(withDuration: TimeInterval(duration)) {
            self.snp.updateConstraints { (make) in
                make.height.equalTo(ScreenHeight - hei + topFrame.size.height)
            }
            self.superview?.layoutIfNeeded()
        }
    }
    
    func loadUI() {
        
        self.addSubview(self.topView)
        self.topView.backgroundColor = .orange
        topView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(54)
        }
        
        let talkBtn = UIButton()
        talkBtn.backgroundColor = .red
        self.topView.addSubview(talkBtn)
        talkBtn.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.height.equalTo(34)
        }
        
        let moreBtn = UIButton()
        moreBtn.backgroundColor = .red
        self.topView.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.bottom.equalTo(talkBtn.snp.bottom)
            make.height.width.equalTo(talkBtn.snp.width)
        }
        moreBtn.addTarget(self, action: #selector(moreBtnClick(sender:)), for: .touchUpInside)
        
        let emojiBtn = UIButton()
        emojiBtn.backgroundColor = .red
        self.topView.addSubview(emojiBtn)
        emojiBtn.snp.makeConstraints { (make) in
            make.right.equalTo(moreBtn.snp.left).offset(-10)
            make.bottom.equalTo(talkBtn.snp.bottom)
            make.height.width.equalTo(talkBtn.snp.width)
        }
        emojiBtn.addTarget(self, action: #selector(emojiBtnClick(sender:)), for: .touchUpInside)
        
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        textView.isScrollEnabled = false
        self.topView.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(talkBtn.snp.right).offset(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(emojiBtn.snp.left).offset(-10)
        }
        textView.layer.cornerRadius = 3.0
        textView.layer.masksToBounds = true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        log.debug(text)
        if text == "\n" {
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.keyboarddismisstype = .None
        log.debug("end editing")
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
        let size = textView.sizeThatFits(constrainSize)//输入框的尺寸
        if size.height > maxheight {
            textView.isScrollEnabled = true
            return
        } else {
            textView.isScrollEnabled = false
            if frame.size.height > size.height {
                log.debug("减小")
                UIView.animate(withDuration: 0.25, animations: {
                    self.snp.updateConstraints({ (make) in
                        make.height.equalTo(self.keyboardHei + 20 + size.height)
                    })
                    self.topView.snp.updateConstraints({ (make) in
                        make.height.equalTo(20 + size.height)
                    })
                    self.superview?.layoutIfNeeded()
                })
            } else if (frame.size.height < size.height) {
                log.debug("增大")
                UIView.animate(withDuration: 0.25, animations: {
                    self.snp.updateConstraints({ (make) in
                        make.height.equalTo(self.keyboardHei + 20 + size.height)
                    })
                    self.topView.snp.updateConstraints({ (make) in
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
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.keyboarddismisstype = .Register
            self.textView.resignFirstResponder()
            if !self.subviews.contains(moreview) {
                moreview.moreviewClick = {
                    [weak self] (title) in
                    log.debug("titel : \(title)")
                    var text = self?.textView.text
                    text?.append(title)
                    self?.textView.text = text
                    self?.textViewDidChange((self?.textView)!)
                }
                self.addSubview(moreview)
                moreview.snp.makeConstraints({ (make) in
                    make.left.right.bottom.equalTo(0)
                    make.top.equalTo(self.topView.snp.bottom)
                })
                self.layoutIfNeeded()
            }
            let topFrame = topView.frame;
            UIView.animate(withDuration: 0.25) {
                self.snp.updateConstraints({ (make) in
                    make.height.equalTo(240 + topFrame.size.height)
                })
                self.keyboardHei = 240
                self.superview?.layoutIfNeeded()
            }
        } else {
            self.keyboarddismisstype = .None
            textView.becomeFirstResponder()
        }
    }
    
    //moreView 回调事件
//    func emojiClick(title : String) {
//        log.debug("titel : \(title)")
//        var text = textView.text
//        text?.append(title)
//        textView.text = text
//        textViewDidChange(textView)
//    }

}
