//
//  YLLoginViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/24.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import Spring
import HyphenateLite

class YLLoginViewController: YLViewController {
    
    var userTextFiled : YLLoginTextField?
    var passwordTextFiled : YLLoginTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "登录"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.once(token: "loginToken") { 
            loadUI()
        }
        
    }
    
    func loadUI() {
        userTextFiled = YLLoginTextField()
        userTextFiled?.setplaceholder(placeholder: "用户名")
        userTextFiled?.textFiled?.text = "8080"
        self.view.addSubview(userTextFiled!)
        userTextFiled!.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.width.equalTo(250)
            make.height.equalTo(36)
            make.centerX.equalTo(self.view)
        }
        appear(view: userTextFiled!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(500)) {
            self.passwordTextFiled = YLLoginTextField()
            self.passwordTextFiled?.setplaceholder(placeholder: "密  码")
            self.passwordTextFiled?.textFiled?.text = "123456"
            self.view.addSubview(self.passwordTextFiled!)
            self.passwordTextFiled!.snp.makeConstraints { (make) in
                make.top.equalTo(self.userTextFiled!.snp.bottom).offset(25)
                make.width.equalTo(250)
                make.height.equalTo(36)
                make.centerX.equalTo(self.view)
            }
            self.appear(view: self.passwordTextFiled!)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(1000)) {
            let image = UIImage.creatImageWithHexColor(hexColor: "00a4e1", alpha: 1.0)
            let highlightImage = UIImage.creatImageWithColor(color: randColor(r: 19.0, g: 146.0, b: 218.0, a: 1.0))
            let loginBtn = SpringButton(type: .custom)
            loginBtn.setBackgroundImage(image, for: .normal)
            loginBtn.setBackgroundImage(highlightImage, for: .highlighted)
            loginBtn.setTitle("login", for: .normal)
            self.view.addSubview(loginBtn)
            loginBtn.snp.makeConstraints { (make) in
                make.top.equalTo(self.passwordTextFiled!.snp.bottom).offset(30)
                make.width.equalTo(self.passwordTextFiled!.snp.width)
                make.height.equalTo(self.passwordTextFiled!.snp.height)
                make.centerX.equalTo(self.view)
            }
            loginBtn.layer.cornerRadius = 5.0
            loginBtn.layer.masksToBounds = true
            self.appearBtn(view: loginBtn)
            loginBtn.addTarget(self, action: #selector(self.loginBtnClick(sender:)), for: .touchUpInside)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(1500)) {
            let registerBtn = UIButton(type: .custom)
            registerBtn.setTitle("注册账号", for: .normal)
            registerBtn.setTitleColor(UIColor.hexStringToColor("00a4e1", alpha: 1.0), for: .normal)
            registerBtn.titleLabel?.font = UIFont(name: "Tensentype-RuiHeiJ-W2", size: 12.0)
            self.view.addSubview(registerBtn)
            registerBtn.addTarget(self, action: #selector(self.registerBtnClick(sender:)), for: .touchUpInside)
            registerBtn.snp.makeConstraints { (make) in
                make.top.equalTo(self.passwordTextFiled!.snp.bottom).offset(70)
                make.right.equalTo(self.passwordTextFiled!.snp.right)
            }
        }
    }
    
    //出场动画
    func appear(view : SpringView) {
        view.animation = "squeezeRight"
        view.curve = "easeIn"
        view.force = 1.0
        view.duration = 0.5
        view.animate()
    }
    func appearBtn(view : SpringButton) {
        view.animation = "squeezeRight"
        view.curve = "easeIn"
        view.force = 1.0
        view.duration = 0.5
        view.animate()
    }
    
    func registerBtnClick(sender:SpringButton) {
        log.debug("clickRegister Btn")
        let registerVC = YLRegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    deinit {
        log.debug("loginViewController 释放")
    }
    
    // MARK: Private
    
    func loginBtnClick(sender : SpringButton) {
        log.debug("login success")
        let error = EMClient.shared().login(withUsername: userTextFiled?.textFiled?.text, password: passwordTextFiled?.textFiled?.text)
        if error == nil {
            log.debug("登陆成功")
            self.view.endEditing(true)
            self.dismiss(animated: true, completion: nil)
        }
    }

}
