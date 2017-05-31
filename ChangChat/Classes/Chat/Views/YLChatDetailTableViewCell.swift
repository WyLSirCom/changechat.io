//
//  YLChatDetailTableViewCell.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/5/31.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLChatDetailTableViewCell: UITableViewCell {

    var headerImageView : UIImageView?
    var nameLabel : UILabel?
    var messageLabel : UILabel?
    var timeLabel : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        //头像
        headerImageView = UIImageView()
        headerImageView?.backgroundColor = .red
        headerImageView?.image = #imageLiteral(resourceName: "tiger")
        self.contentView.addSubview(headerImageView!)
        headerImageView?.snp.makeConstraints({ (make) in
            make.top.equalTo(8)
            make.left.equalTo(10)
            make.bottom.equalTo(-8)
            make.height.width.equalTo(50)
        })
        headerImageView?.layer.cornerRadius = 25.0
        headerImageView?.layer.masksToBounds = true
        
        //名字
        nameLabel = UILabel()
        nameLabel?.text = "my name"
        self.contentView.addSubview(nameLabel!)
        nameLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo((self.headerImageView?.snp.top)!).offset(2)
            make.left.equalTo((self.headerImageView?.snp.right)!).offset(10)
        })
        
        //最后一个聊天内容
        messageLabel = UILabel()
        messageLabel?.text = "hello word"
        self.contentView.addSubview(messageLabel!)
        messageLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo((self.nameLabel?.snp.left)!)
            make.bottom.equalTo((self.headerImageView?.snp.bottom)!).offset(-2)
        })
        
        //最后一个聊天的时间
        timeLabel = UILabel()
        timeLabel?.text = "2017.5.30"
        self.contentView.addSubview(timeLabel!)
        timeLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.top.equalTo(5)
        })
    }

}


//搜索的cell
class YLChatDetailSearchTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        //qq的搜索更可能是一个按钮
        let textField = UITextField()
        textField.backgroundColor = randColor(r: 238, g: 239, b: 243, a: 1.0)
        let style  = NSMutableParagraphStyle()
        style.alignment = .center
        let attri = NSAttributedString(string: "search", attributes: [NSParagraphStyleAttributeName:style])
        textField.attributedPlaceholder = attri
        self.contentView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(5, 5, 5, 5))
            make.height.equalTo(30)
        }
    }
}
