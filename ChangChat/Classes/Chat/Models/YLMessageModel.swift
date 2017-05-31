//
//  YLMessageModel.swift
//  ChangChat
//
//  Created by wyl on 2017/5/27.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

enum YLMessageFrom {
    case Me
    case Other
}
class YLMessageModel: NSObject {
    var ishiddenTimelabel : Bool?
    var contentText : String?
    var time : String?
    var from : YLMessageFrom?

}
