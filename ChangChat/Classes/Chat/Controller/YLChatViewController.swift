//
//  YLChatViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit


let messageCell = "messageCell"

class YLChatViewController: YLViewController, UITableViewDataSource, UITableViewDelegate {
    
    //懒加载格式
    //lazy var 变量: 类型 = { 创建变量代码(相当于闭包) }()
    lazy var tableView :UITableView = {
        () -> UITableView in
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(YLMessageTableViewCell.self, forCellReuseIdentifier: messageCell)
        tb.rowHeight = UITableViewAutomaticDimension
        tb.estimatedRowHeight = 100
        return tb
    }()
    
    lazy var datas : Array<YLMessageFrame> = {
        let arr = Array<YLMessageFrame>()
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "聊天"
        loadUI()
        
        for _ in 0 ... 10 {
            testMessage()
        }
        tableView.reloadData()
    }
    
    func loadUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView!.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
    }
    
    //测试
    
    func testMessage() {
        let message = YLMessageModel()
        message.contentText = "hadjahhfjksfgsgsdfgasfgsfgakjfkajfksjfkdjfklajfkjakdjfklfjakdjskljfklajdskfjakjdfadfdfasdfdfgfadhf"
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
    
}
