//
//  YLEmojiView.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/2.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

class YLEmojiView: UIView {

    lazy var collectionView : UICollectionView = {
        () -> UICollectionView in
        let layout = YLEmojiCollectionLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return cv
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        self.addSubview(collectionView)
    }

}


class YLEmojiCollectionLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
