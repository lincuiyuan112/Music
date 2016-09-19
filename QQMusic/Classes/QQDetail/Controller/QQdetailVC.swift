//
//  QQdetailVC.swift
//  QQMusic
//
//  Created by LCY on 16/8/15.
//  Copyright © 2016年 lincuiyuan. All rights reserved.
//

import UIKit

class QQdetailVC: UIViewController {

    // 当歌曲切换时, 控件的更新频率
    /// 歌词的占位scrollView
    @IBOutlet weak var lrcBackView: UIScrollView!
    
    
    /// 进度条 (n)
    @IBOutlet weak var progressSlider: UISlider!
    /// 歌词label(n)
    @IBOutlet weak var lrcLabel: QQLrcLabel!
    /// 播放/暂停按钮()
    @IBOutlet weak var playOrPauseBtn: UIButton!
    /// 播放时长(n)
    @IBOutlet weak var costTimeLabel: UILabel!
    
    
    /// 前景小图片 (1)
    @IBOutlet weak var singerIconIMV: UIImageView!
    /// 大的背景(1)
    @IBOutlet weak var backIMV: UIImageView!
    /// 歌曲名称(1)
    @IBOutlet weak var songNameLabel: UILabel!
    /// 歌手名称(1)
    @IBOutlet weak var singerNameLabel: UILabel!
    /// 总时长(1)
    @IBOutlet weak var totalTimeLabel: UILabel!
    //歌词视图
    var lrcTableView = UITableView?()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        layoutViews()
    }
    
    func layoutViews() {
        
        lrcTableView?.frame = lrcBackView.bounds
        lrcTableView?.x = lrcBackView.width
        
        lrcBackView.contentSize = CGSize(width: lrcBackView.width * 2, height: 0)
        singerIconIMV.layer.cornerRadius = singerIconIMV.width * 0.5
        
        singerIconIMV.layer.masksToBounds = true
        
    }

    
    @IBAction func blackBtnClick(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    //暂停,播放
    @IBAction func playPauseBtn(sender: AnyObject) {
        
        playOrPauseBtn.selected = !playOrPauseBtn.selected
        if playOrPauseBtn.selected {
            QQMusicSwitchNext.shareInstance.play()
        }else{
            QQMusicSwitchNext.shareInstance.pause()
        }
        
    }
    //上一首
    @IBAction func preMusicBtn(sender: AnyObject) {
        
        
    }
    //下一首
    @IBAction func nextMusicBtn(sender: AnyObject) {
    }

    
}
