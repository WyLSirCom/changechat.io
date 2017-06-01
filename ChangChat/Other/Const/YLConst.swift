//
//  YLConst.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import SnapKit


let ScreenSize     =    UIScreen.main.bounds.size
let ScreenWidth    =    UIScreen.main.bounds.size.width
let ScreenHeight   =    UIScreen.main.bounds.size.height

let RHFont         =    UIFont(name: "Tensentype-RuiHeiJ-W2", size: 18)

//RGB颜色
func randColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func transition(type : String, subtype : String, view : UIView) {
    let transition = CATransition()
    transition.duration = 0.5
    transition.type = type
    transition.subtype = subtype
    view.layer.add(transition, forKey: nil)
    
}
