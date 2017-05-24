//
//  AppDelegate.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import HyphenateLite

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let options = EMOptions(appkey: "1144170523115844#changchat")
        EMClient.shared().initializeSDK(with: options)
        
        setupTabbar()
        
        return true
    }
    
    func setupTabbar() {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        let tabbar = YLTabBarViewController()
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
        
    }
}

