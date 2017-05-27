//
//  YLChatViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit




let leftCell = "leftCell"

class YLChatViewController: YLViewController, UITableViewDataSource, UITableViewDelegate {
    
    //懒加载格式
    //lazy var 变量: 类型 = { 创建变量代码(相当于闭包) }()
    lazy var tableView :UITableView = {
        () -> UITableView in
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(YLLeftTextTableViewCell.self, forCellReuseIdentifier: leftCell)
        tb.rowHeight = UITableViewAutomaticDimension
        tb.estimatedRowHeight = 100
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "聊天"
        loadUI()
    }
    
    func loadUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView!.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-49)
            
        }
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: leftCell, for: indexPath)
        return cell
    }
    
}
