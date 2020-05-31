//
//  SettingViewCell.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/30.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit

class SettingViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    func updateView(settingModel: SettingViewCellModel) {
        
        titleLbl.text = settingModel.titleLbl
        
        statusLbl.text = settingModel.statusLbl
        
    }
    
}
