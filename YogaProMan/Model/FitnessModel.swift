//
//  FitnessCategory.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/20.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct FitnessModel: Codable {
    
    private(set) public var secondTitle: String!
    private(set) public var title: String!
    private(set) public var imageName: String!
    
    init(title: String, imageName: String, secondTitle: String) {
        
        self.title = title
        self.imageName = imageName
        self.secondTitle = secondTitle
        
    }
    
}
