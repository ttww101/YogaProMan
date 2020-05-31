//
//  SettingModel.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/30.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct SettingModel: Codable {
    
    private(set) public var titleLbl: String
    private(set) public var statusLbl: String

    init(titleLbl: String,
         statusLbl: String) {
        
        self.titleLbl = titleLbl
        self.statusLbl = statusLbl
        
    }
    
}
