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

class YLChatViewController: YLViewController, UITableViewDataSource, UITableViewDelegate, ToolBarDelegate{
    
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
        
        
        loadUI()
        //测试
        for _ in 0 ... 10 {
            testMessage()
        }
        tableView.reloadData()
        //完成
    }
    
    deinit {
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
    
    func testMessage() {
        let message = YLMessageModel()
        message.contentText = "hadja啊大煞风景卡回到家客服回答时间开始凤凰健康阿富汗将卡的恢复健康后hh"
        message.from = .Other
        message.ishiddenTimelabel = false
        message.time = "12345879"
        
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
    


//    func didClickReturn(text: String, barView: YLToolBarView, textView: UITextView) {
//        log.debug("text \(text)")
//        sendMessage(text: text)
//        textView.text = ""
//    }
    
//    func sendMessage(text : String) {
//        let frameModel = messageManager.creatMessage(text: text)
//    }
    
}
