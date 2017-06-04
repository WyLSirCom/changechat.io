//
//  YLEmojiView.swift
//  ChangChat
//
//  Created by 魏延龙 on 2017/6/2.
//  Copyright © 2017年 wyl. All rights reserved.
//

import UIKit

let emojiCell = "emojiCell"
class YLEmojiView: UIView ,UICollectionViewDelegate,UICollectionViewDataSource{

    var datas = Array<YLEmojiModel>()
    
    lazy var collectionView : UICollectionView = {
        () -> UICollectionView in
        let layout = YLEmojiCollectionLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(YLEmojiCollectionCell.self, forCellWithReuseIdentifier: emojiCell)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
        loadEmoji()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    func loadEmoji() {
        let arr = YLEmojiModel.emoji()
        datas = datas + arr
        for key in arr {
            log.debug("info \(key.code!.emojiStr())")
            
        }
    }

    
    // MARK: UICollectionViewDelegate,UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: emojiCell, for: indexPath) as! YLEmojiCollectionCell
        let model = datas[indexPath.item]
        cell.setEmojiImage(emojicodeStr: model.code!.emojiStr())
        return cell
    }
    
}


class YLEmojiCollectionLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.itemSize = CGSize(width: 40, height: 40)
        self.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2)
        self.minimumLineSpacing = 2
        self.minimumInteritemSpacing = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class YLEmojiCollectionCell:UICollectionViewCell {
    
    var emojibtn = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadUI() {
        self.contentView.addSubview(emojibtn)
        emojibtn.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
    }
    
    func setEmojiImage(emojicodeStr : String) {
        emojibtn.setTitle(emojicodeStr, for: .normal)
    }
}
