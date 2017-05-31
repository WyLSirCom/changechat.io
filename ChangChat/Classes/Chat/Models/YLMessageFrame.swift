//
//  YLMessageFrame.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/5/31.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLMessageFrame: NSObject {
    
    var iconF : CGRect?
    var timeF : CGRect?
    var textF : CGRect?
    var cellHeight : CGFloat?
    var message : YLMessageModel?{
        didSet{
            let mess = message
            let padding : CGFloat = 20
            //时间
            if !(mess?.ishiddenTimelabel)! {
                let timeX : CGFloat = 0
                let timeY : CGFloat = 0
                let timeW : CGFloat = ScreenWidth
                let timeH : CGFloat = 20
                timeF = CGRect(x: timeX, y: timeY, width: timeW, height: timeH)
            }
            
            //头像
            let iconY : CGFloat = (timeF?.maxY)!
            let iconW : CGFloat = 52
            let iconH : CGFloat = 52
            let iconX : CGFloat;
            if mess?.from == .Me {
                iconX = ScreenWidth - padding - iconW
            } else {
                iconX = padding
            }
            iconF = CGRect(x: iconX, y: iconY, width: iconW, height: iconH)
            
            //正文
            let textY = iconY
            let textMaxSize = CGSize(width:CGFloat(200.0) , height:CGFloat(MAXFLOAT))
            let text = NSString(string: (mess?.contentText)!)
            let textRealSize = text.sizeWithFont(font: UIFont.systemFont(ofSize: 15), maxSize: textMaxSize)
            let textBtnSize = CGSize(width: textRealSize.width + 20, height: textRealSize.height + 20)
            let textX : CGFloat
            if mess?.from == .Me {
                textX = iconX - textBtnSize.width - 10
            } else {
                textX = (iconF?.maxX)! + 10
            }
            textF = CGRect(origin: CGPoint(x: textX, y: textY), size: textBtnSize)
            
            cellHeight = max(iconF!.maxY, textF!.maxY)
            
        }
    }
    
}
