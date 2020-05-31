//
//  SummaryCellModel.swift
//  Moving
//
//  Created by SYBM on 2018/11/5.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct SettingViewCellModel {
    
    private(set) public var titleLbl: String
    private(set) public var statusLbl: String
    
    init(settingModel: SettingModel) {
        
        self.titleLbl = settingModel.titleLbl
        self.statusLbl = settingModel.statusLbl
        
    }
    
}
