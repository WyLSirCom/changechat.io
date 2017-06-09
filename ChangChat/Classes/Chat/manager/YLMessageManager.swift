//
//  YLMessageManager.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/9.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import HyphenateLite
class YLMessageManager: NSObject,EMChatManagerDelegate {
    
    override init() {
        super.init()
        EMClient.shared().add(self as! EMClientDelegate, delegateQueue: nil)
    }
    
    func ConstructorText(text: String) {
        let body = EMTextMessageBody(text: text)
        let from = EMClient.shared().currentUsername
        
        let message = EMMessage(conversationID: "6001", from: from, to: "6001", body: body, ext: nil)
        message?.chatType = EMChatTypeChat
        
        EMClient.shared().chatManager.send(message, progress: nil) { (message, error) in
            
        }
    }
    
    func messagesDidReceive(_ aMessages: [Any]!) {
        
    }
    
    func creatMessage(text: String) -> YLMessageFrame {
        ConstructorText(text: text)//发送文字消息
        let message = YLMessageModel()
        message.contentText = text
        message.from = .Me
        message.ishiddenTimelabel = false
        message.time = "12345879"
        let frame = YLMessageFrame()
        frame.message = message
        return frame
    }
    
    

}
