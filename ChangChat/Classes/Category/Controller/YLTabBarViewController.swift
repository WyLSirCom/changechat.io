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
        let chat = setupUI(ViewController: YLChatListViewController(), title: "聊天", image: "", select: "")
        let contact = setupUI(ViewController: YLContactViewController(), title: "联系人", image: "", select: "")
        let tainment = setupUI(ViewController: YLEntertainmentViewController(), title: "娱乐", image: "", select: "")
        self.viewControllers = [chat,contact,tainment]
    }
    
    func setupUI(ViewController:YLViewController , title:String , image:String , select:String) -> YLNavigationController {
        let vc = ViewController
        let Navi = YLNavigationController(rootViewController: vc)
        let TabbarItem = UITabBarItem(title: title, image: UIImage(named: image), selectedImage: UIImage(named: select))
        Navi.navigationBar.isHidden = true
        Navi.tabBarItem = TabbarItem
        return Navi
    }
    
}
