//
//  QQListcell.swift
//  QQMusic
//
//  Created by LCY on 16/8/16.
//  Copyright © 2016年 lincuiyuan. All rights reserved.
//

import UIKit


enum AnimationType {
    case Scale
    case Rotation
}

class QQListcell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    var listM = QQMusicItem?()
        {
        didSet{
          titleLabel.text = listM?.name
          cellImageView.image = UIImage(named: (listM?.singerIcon)!)
          subLabel.text = listM?.singer
        }
    }
    func animation(animationType: AnimationType)  {
        if animationType == .Scale  {
            self.layer.removeAnimationForKey("scale")
            let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
            animation.values = [0.0, 0.5, 1.0, 0.5, 1.0]
            animation.duration = 0.5
            self.layer.addAnimation(animation, forKey: "scale")
            return
        }
        
        if animationType == .Rotation  {
            self.layer.removeAnimationForKey("rotation")
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            animation.values = [0.0, 0.5, 1.0, 0.5, 1.0, 0.0]
            animation.duration = 0.5
            self.layer.addAnimation(animation, forKey: "rotation")
        }
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView!.layer.cornerRadius = (cellImageView!.frame.size.width) * 0.5
        cellImageView!.layer.masksToBounds = true

    }
    
   static func cellAssignment(reuseIdentifier: String,tableView: UITableView) -> QQListcell {
        var cell: QQListcell? = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? QQListcell
        if cell == nil {
             cell = NSBundle.mainBundle().loadNibNamed("QQListcell", owner: nil, options: nil).first as? QQListcell
        }
   
        return cell!
    }
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
  
        
    }


}
