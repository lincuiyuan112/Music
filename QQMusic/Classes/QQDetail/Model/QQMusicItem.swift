//
//  QQMusicItem.swift
//  QQMusic
//
//  Created by LCY on 16/8/15.
//  Copyright © 2016年 lincuiyuan. All rights reserved.
//

import UIKit

class QQMusicItem: NSObject {
//歌名
    var name :String?
//    文件名
    var filename :String?
//    歌词名
    var lrcname :String?
//    歌手
    var singer :String?
//    歌手图
    var singerIcon :String?
//    背景图
    var icon :String?
    

    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
