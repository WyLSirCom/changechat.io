//
//  YLToolBox.swift
//  ChangChat
//
//  Created by wyl on 2017/5/24.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit
import Spring



// MARK: - DispatchQueue的分类
public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /// block代码只执行一次
    ///
    /// - Parameters:
    ///   - token: 对于执行的代码传递一个唯一标示，如果_onceTracker数组内没有token会执行一次，然后添加进_onceTracker。
    ///   - block: 只执行一次的代码
    public class func once(token: String, block:() -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}


// MARK: - UIColor的分类
public extension UIColor {
    
    /// 根据传入的16进制颜色字符串转成UIColor
    ///
    /// - Parameters:
    ///   - colorStr: 16进制颜色字符串
    ///   - alpha: 透明度
    /// - Returns: 转换得到的UIColor
    class func hexStringToColor(_ colorStr:String,alpha : CGFloat) -> UIColor {
        var color = UIColor.red
        var cStr : String = colorStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cStr.hasPrefix("#") {
            let index = cStr.index(after: cStr.startIndex)
            cStr = cStr.substring(from: index)
        }
        if cStr.characters.count != 6 {
            return UIColor.black
        }
        
        let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
        let rStr = cStr.substring(with: rRange)
        
        let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
        let gStr = cStr.substring(with: gRange)
        
        let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
        let bStr = cStr.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
        
        return color
    }
}


// MARK: - UIImage的分类
public extension UIImage {
    
    /// 根据传入的颜色生成图片
    ///
    /// - Parameter color: 要生成图片的颜色
    /// - Returns: 生成的图片
    class func creatImageWithColor(color : UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// 根据传入的16进制颜色字符串生成图片
    ///
    /// - Parameters:
    ///   - hexColor: 16进制颜色字符串
    ///   - alpha: 透明度
    /// - Returns: 生成的图片
    class func creatImageWithHexColor(hexColor : String, alpha : CGFloat) -> UIImage {
        let color = UIColor.hexStringToColor(hexColor, alpha: alpha)
        let image = UIImage.creatImageWithColor(color: color)
        return image
    }
}


// MARK: - NSString 的分类
public extension NSString {
    func sizeWithFont(font : UIFont , maxSize : CGSize) -> CGSize {
        let attrs = [NSFontAttributeName : font]
        return self.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: attrs, context: nil).size
        
    }
}

