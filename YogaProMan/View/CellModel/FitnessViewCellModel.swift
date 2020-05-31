//
//  FitnessViewCellModel.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/10/2.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct FitnessViewCellModel {
    
    let imageName: String
    let title: String
    let subTitle: String
    
    init(category: FitnessModel) {
        
        self.imageName = category.imageName
        self.title = category.title
        self.subTitle = category.secondTitle
    
    }
    
}
