//
//  SettingViewSwitchCellModel.swift
//  Moving
//
//  Created by SYBM on 2018/11/5.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct SettingViewSwitchCellModel {
    
    private(set) public var titleLbl: String
    private(set) public var statusSwitch: Bool
    
    init(settingSwitchModel: SettingSwitchModel) {
        
        self.titleLbl = settingSwitchModel.titleLbl
        self.statusSwitch = settingSwitchModel.statusSwitch
        
    }
    
}
