//
//  SettingViewSwitchCell.swift
//  FitnessProMan
//
//  Created by SYBM on 2019/07/1.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit

class SettingViewSwitchCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    func updateView(settingModel: SettingViewSwitchCellModel) {
        
        titleLbl.text = settingModel.titleLbl
        
        statusSwitch.isOn = settingModel.statusSwitch
        
    }
    
}
