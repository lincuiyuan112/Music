//
//  QQMusicTool.swift
//  QQMusic
//
//  Created by LCY on 16/8/16.
//  Copyright © 2016年 lincuiyuan. All rights reserved.
//

import UIKit
import AVFoundation

class QQMusicTool: NSObject {

    
    func playMusicBack() {
        let audioSession = AVAudioSession.sharedInstance()
        try?audioSession.setCategory(AVAudioSessionCategoryPlayback)
        try?audioSession.setActive(true)
    }
    
    var currenMusicPlay = AVAudioPlayer?()
    
    
     func playMusic(musicUrl: String?) {
        
        guard let url = NSBundle.mainBundle().URLForResource(musicUrl, withExtension: nil) else{
            return
        }
        //防止播放同一首
        if currenMusicPlay?.url == url {
            currenMusicPlay?.play()
            return
        }
        
        currenMusicPlay = try!AVAudioPlayer(contentsOfURL: url)
        currenMusicPlay?.delegate = self
        currenMusicPlay?.prepareToPlay()
        currenMusicPlay?.play()
        
        
    }
    func playMusic() {
        currenMusicPlay?.play()
    }
    func pauseMusic() {
        currenMusicPlay?.pause()
    }
    func stopMusic() {
        currenMusicPlay?.stop()
    }
    
    
}

extension QQMusicTool: AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        //通知
        NSNotificationCenter.defaultCenter().postNotificationName("notification", object: nil)
    }
}
