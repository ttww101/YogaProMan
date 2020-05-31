//
//  SettingSwitchModel.swift
//  FitnessProMan
//
//  Created by SYBM on 2019/07/1.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct SettingSwitchModel: Codable {
    
    private(set) public var titleLbl: String
    private(set) public var statusSwitch: Bool
    
    init(titleLbl: String,
         statusSwitch: Bool) {
        
        self.titleLbl = titleLbl
        self.statusSwitch = statusSwitch
        
    }
    
}
