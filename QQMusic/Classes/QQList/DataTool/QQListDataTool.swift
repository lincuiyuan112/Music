//
//  QQListDataTool.swift
//  QQMusic
//
//  Created by LCY on 16/8/15.
//  Copyright © 2016年 lincuiyuan. All rights reserved.
//

import UIKit

class QQListDataTool: NSObject {

    
    
    static func loadListData(result:(listItem: [QQMusicItem])->()) {
        
        guard let path = NSBundle.mainBundle().pathForResource("Musics.plist", ofType: nil) else
        {
            return
        }
        
        
        guard let dicArry = NSArray(contentsOfFile: path) as? [[String: AnyObject]] else {
            return
        }
        
        var items = [QQMusicItem]()
        for dic in dicArry {
            
            let item = QQMusicItem(dic: dic)
            items.append(item)
        }
        //两个的模型数据
        result(listItem: items + items)
    }
}
