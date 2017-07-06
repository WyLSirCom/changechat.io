//
//  YLChatViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import HyphenateLite


let messageCell = "messageCell"

class YLChatViewController: YLViewController, UITableViewDataSource, UITableViewDelegate, ToolBarDelegate, YLMessageManagerDelegate{
    
    //懒加载格式
    //lazy var 变量: 类型 = { 创建变量代码(相当于闭包) }()
    lazy var tableView :UITableView = {
        () -> UITableView in
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(YLMessageTableViewCell.self, forCellReuseIdentifier: messageCell)
        tb.estimatedRowHeight = 100
        tb.rowHeight = UITableViewAutomaticDimension
        tb.separatorStyle = .none
        return tb
    }()
    
    lazy var datas : Array<YLMessageFrame> = {
        let arr = Array<YLMessageFrame>()
        return arr
    }()
    let chatView = YLToolBarView()//输入框的view
    
    let messageManager = YLMessageManager.share
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "聊天"
        messageManager.delegate = self
        
        loadUI()
        tableView.reloadData()
        //完成
    }
    
    deinit {
        messageManager.delegate = nil;
        log.debug("chatView 释放")
    }
    
    func loadUI() {
        
        chatView.delegate = self as ToolBarDelegate
        self.view.addSubview(chatView)
        chatView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(54)
        }
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView!.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(chatView.snp.top)
            
        }
    }
    
    //测试
    
    func CreatMessageModel(text : String, time : String) {
        let message = YLMessageModel()
        message.contentText = text
        message.from = .Other
        message.ishiddenTimelabel = false
        message.time = time
        
        let frame = YLMessageFrame()
        frame.message = message
        datas.append(frame)
    }
    
    //结束
    
    
    // MARK: UITableViewDelegate, UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCell, for: indexPath) as! YLMessageTableViewCell
        cell.messageFrame = datas[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let frame = datas[indexPath.row]
        return frame.cellHeight!
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: YLTABLEVIEWSCROLLNOTIFATION), object: nil)
    }
    
    // MARK: ToolBarDelegate
    
    func didClickReturn(text: String, barView: YLToolBarView, textView: UITextView) {
        log.debug("text \(text)")
        sendMessage(text: text)
    }
    
    func sendMessage(text : String) {
        let frameModel = messageManager.creatMessage(text: text)
        datas.append(frameModel)
        tableView.reloadData()
    }
    
    // MARK: 接到消息
    func messageManagerDidReceiveMessage(message: Array<Any>) {
        for model in message {
            let mm = model as! EMMessage
            let textBody : EMTextMessageBody = mm.body as! EMTextMessageBody
            CreatMessageModel(text: textBody.text, time: "\(mm.timestamp)")
        }
        tableView.reloadData()
    }
    
}
