//
//  YLEmojiModel.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/3.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLEmojiModel: NSObject {

    var code : String?
    var type : String?
    
    static let properties = ["code","type"]
    
    init(dic:[String : Any]) {
        super.init()
        for key in YLEmojiModel.properties {
            if dic[key] != nil {
                setValue(dic[key], forKey: key)
            }
        }
    }
    
    class func emoji() -> Array<YLEmojiModel> {
        let path = Bundle.main.path(forResource: "SystemEmoji", ofType: "plist")
        let emojis = NSArray(contentsOfFile: path!)
        var emojiMutable = Array<YLEmojiModel>()
        for emoj in emojis! {
            let model = YLEmojiModel(dic: emoj as! Dictionary<String, Any>)
            emojiMutable.append(model)
        }
        return emojiMutable
    }
    
}
