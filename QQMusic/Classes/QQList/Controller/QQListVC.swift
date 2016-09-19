//
//  QQListVC.swift
//  QQMusic
//
//  Created by LCY on 16/8/15.
//  Copyright © 2016年 lincuiyuan. All rights reserved.
//

import UIKit
private let cellId: String = "cellid"
class QQListVC: UITableViewController {

    var listMs: [QQMusicItem] = [QQMusicItem](){
        didSet{
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBarHidden = true
        
        let iamgeV = UIImageView(image: UIImage(named: "QQListBack"))
        tableView.backgroundView = iamgeV
        tableView.separatorStyle = .None
        loadData()
    }
    
    func loadData() {
        QQListDataTool.loadListData { (listItem) in
            self.listMs = listItem
            QQMusicSwitchNext.shareInstance.playMusicList = listItem
        }
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listMs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = QQListcell.cellAssignment(cellId, tableView: tableView)
        
        cell.listM = self.listMs[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! QQListcell).animation(.Scale)
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        QQMusicSwitchNext.shareInstance.playModel = self.listMs[indexPath.row]
        QQMusicSwitchNext.shareInstance.playMusic()
        
        performSegueWithIdentifier("idDtail", sender: nil)
        
    }

   
}
