//
//  AppDelegate.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import HyphenateLite
import XCGLogger

let log = XCGLogger.default

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let options = EMOptions(appkey: "1144170523115844#changchat")
        EMClient.shared().initializeSDK(with: options)
        
        //打印的设置
        setLog()
        
        //加载tabbar
        setupTabbar()
        
        //loginViewController
        login()
        return true
    }
    
    func setLog() {
        let cachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        let logurl = cachePath?.appendingPathComponent("log.txt")
        log.setup(level: .debug, showLogIdentifier: true, showFunctionName: true, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: true, writeToFile: logurl, fileLevel: .debug)
    }
    
    func setupTabbar() {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        let tabbar = YLTabBarViewController()
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
        
    }
    
    func login() {
        let loginvc = YLLoginViewController()
        let loginNavi = YLNavigationController(rootViewController: loginvc)
        
        let rootvc = UIApplication.shared.keyWindow?.rootViewController
        rootvc?.present(loginNavi, animated: true, completion: {
            
        })
        
    }
}

