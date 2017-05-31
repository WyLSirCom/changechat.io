//
//  YLEntertainmentViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit


let kheight:CGFloat = 200

class YLEntertainmentViewController: YLViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var tableView :UITableView = {
        () -> UITableView in
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "encell")
        tb.rowHeight = UITableViewAutomaticDimension
        tb.estimatedRowHeight = 100
        tb.contentInset = UIEdgeInsetsMake(kheight, 0, 0, 0)
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel?.text = "娱乐"
        loadUI()
    }
    
    func loadUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView!.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-49)
        }
        let titleImageView = UIImageView()
//        titleImageView.frame = CGRect(x: 0, y: -kheight, width: ScreenWidth, height: kheight)
        titleImageView.tag = 101
        titleImageView.backgroundColor = .red
//        titleImageView.contentMode = .scaleAspectFill
        titleImageView.image = #imageLiteral(resourceName: "timg")
        tableView.addSubview(titleImageView)
        titleImageView.snp.makeConstraints { (make) in
            make.top.equalTo(-kheight)
            make.left.right.equalTo(0)
//            make.height.equalTo(kheight)
            make.bottom.equalTo(self.tableView.snp.top)
        }
        self.view.layoutIfNeeded()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "encell", for: indexPath)
        cell.textLabel?.text = "text"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        if point.y < -kheight {
//            let imageView = tableView.viewWithTag(101)
////            tableView.viewWithTag(101)?.frame = rect!
//            imageView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: -point.y)
        }
    }

}
