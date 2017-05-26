//
//  YLRegisterViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/24.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import Spring

class YLRegisterViewController: YLViewController {
    
    var userTextFiled : YLLoginTextField?
    var passwordTextFiled : YLLoginTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.titleLabel?.text = "注册"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadUI()
    }
    
    func loadUI() {
        userTextFiled = YLLoginTextField()
        userTextFiled?.setplaceholder(placeholder: "用户名")
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
            let registerBtn = SpringButton(type: .custom)
            registerBtn.setBackgroundImage(image, for: .normal)
            registerBtn.setBackgroundImage(highlightImage, for: .highlighted)
            registerBtn.setTitle("register", for: .normal)
            self.view.addSubview(registerBtn)
            registerBtn.snp.makeConstraints { (make) in
                make.top.equalTo(self.passwordTextFiled!.snp.bottom).offset(30)
                make.width.equalTo(self.passwordTextFiled!.snp.width)
                make.height.equalTo(self.passwordTextFiled!.snp.height)
                make.centerX.equalTo(self.view)
            }
            registerBtn.layer.cornerRadius = 5.0;
            registerBtn.layer.masksToBounds = true;
            
            self.appearBtn(view: registerBtn)
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
    
    deinit {
        print("register viewcontroller deinit")
    }

}
