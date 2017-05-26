//
//  YLViewController.swift
//  ChangChat
//
//  Created by wyl on 2017/5/23.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLViewController: UIViewController {

    var titleView : UIView?
    var titleLabel : UILabel?
    var leftBtn : UIButton?
    var rightBtn : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTitleView()
        
    }

    func loadTitleView() {
        titleView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 64))
        self.view.addSubview(titleView!)
        let startColor = randColor(r: 106.0, g: 202.0, b: 249.0, a: 1.0)
        let endColor = randColor(r: 66.0, g: 105.0, b: 170.0, a: 1.0)
        let gradientColors : [CGColor] = [startColor.cgColor,endColor.cgColor]
        let gradientlayer = drawlinearGradient(colors: gradientColors, startPoint: CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint(x: 1.0, y: 0.0))
        gradientlayer.frame = (titleView?.bounds)!
        titleView?.layer.addSublayer(gradientlayer)
        
        titleLabel = UILabel()
        titleLabel?.font = RHFont
        titleLabel?.textColor = .white
        titleView!.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(titleView!)
            make.bottom.equalTo(-10)
        })
    }
    
    func drawlinearGradient(colors : [CGColor],startPoint : CGPoint,endPoint : CGPoint) -> CAGradientLayer{
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = colors
        gradientlayer.startPoint = startPoint
        gradientlayer.endPoint = endPoint
        return gradientlayer
    }
    
}
