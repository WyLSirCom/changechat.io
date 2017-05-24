//
//  YLLoginViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/24.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import Spring

class YLLoginViewController: YLViewController {
    
    var userTextFiled : SpringTextField?
    var passwordTextFiled : SpringTextField?
    
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
        userTextFiled = SpringTextField()
        userTextFiled?.backgroundColor = .red
        self.view.addSubview(userTextFiled!)
        userTextFiled!.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.width.equalTo(250)
            make.height.equalTo(36)
            make.centerX.equalTo(self.view)
        }
        appear(view: userTextFiled!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(500)) {
            self.passwordTextFiled = SpringTextField()
            self.passwordTextFiled?.backgroundColor = .red
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
            let loginBtn = SpringButton(type: .custom)
            loginBtn.backgroundColor = .red
            loginBtn.setTitle("login", for: .normal)
            self.view.addSubview(loginBtn)
            loginBtn.snp.makeConstraints { (make) in
                make.top.equalTo(self.passwordTextFiled!.snp.bottom).offset(30)
                make.width.equalTo(self.passwordTextFiled!.snp.width)
                make.height.equalTo(self.passwordTextFiled!.snp.height)
                make.centerX.equalTo(self.view)
            }
            self.appearBtn(view: loginBtn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(1500)) {
            let registerBtn = UIButton(type: .custom)
            registerBtn.setTitle("注册账号", for: .normal)
            registerBtn.setTitleColor(.blue, for: .normal)
            registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            self.view.addSubview(registerBtn)
            registerBtn.addTarget(self, action: #selector(self.registerBtnClick(sender:)), for: .touchUpInside)
            registerBtn.snp.makeConstraints { (make) in
                make.top.equalTo(self.passwordTextFiled!.snp.bottom).offset(70)
                make.right.equalTo(self.passwordTextFiled!.snp.right)
            }
        }
        
        
    }
    
    //出场动画
    func appear(view : SpringTextField) {
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
        let registerVC = YLRegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

}
