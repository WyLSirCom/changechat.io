//
//  YLMessageTableViewCell.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/5/31.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLMessageTableViewCell: UITableViewCell {

    var timelabel : UILabel?
    var headerImageBtn : UIButton?
    var contentTextBtn : UIButton?
    var contentImageBtn : UIButton?
    var messageFrame : YLMessageFrame?{
        didSet{
            let messFrame = messageFrame
            let mess = messFrame?.message
            
            //时间
            timelabel?.text = mess?.time
            timelabel?.frame = (messFrame?.timeF)!
            
            //头像
            headerImageBtn?.setImage(#imageLiteral(resourceName: "tiger"), for: .normal)
            headerImageBtn?.frame = (messFrame?.iconF)!
            
            //正文
            contentTextBtn?.setTitle(mess?.contentText, for: .normal)
            contentTextBtn?.frame = (messFrame?.textF)!
            
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                loadUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        //时间
        timelabel = UILabel()
        timelabel?.backgroundColor = .orange
        timelabel?.textAlignment = .center
        self.contentView.addSubview(timelabel!)
        
        //头像
        headerImageBtn = UIButton()
        headerImageBtn?.backgroundColor = .red
        self.contentView.addSubview(headerImageBtn!)
        
        //正文
        contentTextBtn = UIButton()
        contentTextBtn?.titleLabel?.numberOfLines = 0
        contentTextBtn?.backgroundColor = .blue
        contentTextBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        contentTextBtn?.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        self.contentView.addSubview(contentTextBtn!)
        
    }
    
}
