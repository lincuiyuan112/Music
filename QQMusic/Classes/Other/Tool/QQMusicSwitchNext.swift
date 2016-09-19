//
//  QQMusicSwitchNext.swift
//  QQMusic
//
//  Created by LCY on 16/8/16.
//  Copyright © 2016年 lincuiyuan. All rights reserved.
//

import UIKit

class QQMusicSwitchNext: NSObject {
    
    static let shareInstance = QQMusicSwitchNext()
    
    var playTool = QQMusicTool()
    
    var playModel = QQMusicItem?()
    var playMusicList = [QQMusicItem]?()
    
    
    var currenIndex: Int?{
        didSet{
            if playMusicList == nil {
                return
            }
            
            if currenIndex < 0 {
                currenIndex = (playMusicList?.count)! - 1
            }
            if currenIndex > playMusicList?.count {
                currenIndex = 0
            }
            
        }
    }
    
    
    func playMusic() {
        
        playTool.playMusic((playModel?.filename)!)
        
        guard let playList = playMusicList else{
            print("没有播放列表")
            return
        }
        currenIndex = playList.indexOf(self.playModel!)
        
        
    }
    
    func play() {
        playTool.playMusic()
    }
    func pause() {
        playTool.pauseMusic()
    }
    
    func preMusic(){
        
        currenIndex? -= 1
        guard let musicM = self.playMusicList?[currenIndex!] else {
            return
        }
        self.playModel = musicM
        playMusic()

    }
    func nextMusic() {
        currenIndex? += 1
        
      guard let musicM = self.playMusicList?[currenIndex!] else {
            return
        }
        self.playModel = musicM
        playMusic()
        
    }
    

    
}
