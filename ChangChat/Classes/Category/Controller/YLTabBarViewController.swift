//
//  YLTabBarViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let chat = setupUI(toptitle: "聊天", title: "聊天", image: "", select: "")
        let contact = setupUI(toptitle: "联系人", title: "联系人", image: "", select: "")
        let tainment = setupUI(toptitle: "娱乐", title: "娱乐", image: "", select: "")
        self.viewControllers = [chat,contact,tainment]
    }
    
    func setupUI(toptitle:String , title:String , image:String , select:String) -> YLNavigationController {
        let vc = YLViewController()
        let Navi = YLNavigationController(rootViewController: vc)
        let TabbarItem = UITabBarItem(title: title, image: UIImage(named: image), selectedImage: UIImage(named: select))
//        vc.title = toptitle
        vc.titleLabel?.text = toptitle
        Navi.navigationBar.isHidden = true
        Navi.tabBarItem = TabbarItem
        return Navi
    }
    
}
