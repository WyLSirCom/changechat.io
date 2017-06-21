//
//  YLMessageManager.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/9.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import HyphenateLite

@objc public protocol YLMessageManagerDelegate :NSObjectProtocol {
    @objc optional func messageManagerDidReceiveMessage(message : Array<Any>)
}

class YLMessageManager: NSObject,EMChatManagerDelegate {
    
    static let share = YLMessageManager.init()
    var conversationID : String? = nil
    weak var delegate : YLMessageManagerDelegate?
    private override init() {
        super.init()
        EMClient.shared().chatManager.remove(self)
        EMClient.shared().chatManager.add(self, delegateQueue: DispatchQueue.main)
        
    }
    
    func creatConversation(userName : String ,successHand:(_ conversationId : String)->Void) {
        let conversations = EMClient.shared().chatManager.getConversation(userName, type: EMConversationTypeChat, createIfNotExist: true)
        self.conversationID = conversations?.conversationId;
//        log.debug("conversation \(String(describing: conversations?.conversationId))")
        successHand((conversations?.conversationId)!);
    }
    
    func ConstructorText(text: String) {
        let body = EMTextMessageBody(text: text)
        let from = EMClient.shared().currentUsername
        
        let message = EMMessage(conversationID: self.conversationID, from: from, to: "6001", body: body, ext: nil)
        message?.chatType = EMChatTypeChat
        
        EMClient.shared().chatManager.send(message, progress: nil) { (message, error) in
            
        }
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
    
    
// MARK: EMClientDelegate
    func messagesDidReceive(_ aMessages: [Any]!) {
        
        //合理的处理方式，如果处在当前会话，更新消息列表，否则存进数据库
        log.debug("收到消息 \(aMessages)")
        if (self.delegate != nil) {
            delegate?.messageManagerDidReceiveMessage!(message: aMessages)
        }
    }
    func cmdMessagesDidReceive(_ aCmdMessages: [Any]!) {
        log.debug("收到CMD消息 \(aCmdMessages)")
    }
}
