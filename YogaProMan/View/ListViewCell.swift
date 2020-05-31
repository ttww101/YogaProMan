//
//  ListViewCell.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/20.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit
import Kingfisher

class ListViewCell: UITableViewCell {
    
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var intensityLbl: UILabel!
    
    func updateView(listModel: ListViewCellModel) {
        
//        guard let url = URL(string: listModel.videoImg) else {return}
        
        videoImg.image = UIImage(named: listModel.videoImg)

        videoTitle.text = listModel.videoTitle
        
        videoDescription.text = listModel.videoDescription
        
        durationLbl.text = "\(listModel.durationLbl)min"

        intensityLbl.text = listModel.intensity
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
        
    }
    
}
