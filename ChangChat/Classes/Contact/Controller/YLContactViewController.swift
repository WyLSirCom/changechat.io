//
//  YLContactViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import HyphenateLite

let contactCell = "contactCell"

class YLContactViewController: YLViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var tableView :UITableView = {
        () -> UITableView in
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(UITableViewCell.self, forCellReuseIdentifier: contactCell)
        tb.register(YLChatDetailSearchTableViewCell.self, forCellReuseIdentifier: chatDetailSearchCell)
        //        tb.estimatedRowHeight = 66
        //        tb.rowHeight = UITableViewAutomaticDimension
        return tb
    }()
    

    var userlist = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel?.text = "联系人"
        loadUI()
        
        loadData()
    }
    
    func loadData() {
        let error : AutoreleasingUnsafeMutablePointer<EMError?>? = nil ;
        userlist = EMClient.shared().contactManager.getContactsFromServerWithError(error)
        if error == nil {
            log.debug("好友列表 \(self.userlist)")
            self.tableView.reloadData()
        }
        
    }
    
    func loadUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView!.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-49)
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = 0
        switch section {
        case 0:
            row = 1
        case 1:
            row = self.userlist.count
        default:
            return 0
        }
        return row;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: chatDetailSearchCell, for: indexPath) as! YLChatDetailSearchTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: contactCell, for: indexPath)
            let text = self.userlist[indexPath.row]
            cell.textLabel?.text = text as? String
            return cell
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: contactCell, for: indexPath)
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat = 0
        switch indexPath.section {
        case 0:
            height = 40
        case 1:
            height = 66
        default:
            return 0
        }
        return height;
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //实现最上面的cell显示与隐藏
        let point = scrollView.contentOffset
        log.debug("end drag \(point)")
        if point.y > 20 && point.y < 40 {
            let index = IndexPath(row: 0, section: 1)
            tableView.scrollToRow(at: index, at: .top, animated: true)
        } else if (point.y <= 20) {
            let index = IndexPath(row: 0, section: 0)
            tableView.scrollToRow(at: index, at: .top, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatvc = YLChatViewController()
        let id : String = self.userlist[indexPath.row] as! String;
        let messageManager = YLMessageManager.share
        messageManager.creatConversation(userName: id) { (converId) in
            chatvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(chatvc, animated: true)
        }
    }
}
