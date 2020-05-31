//
//  ScoreModel.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/26.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct ScoreModel: Codable {
    
    private(set) public var scoreImg: String
    private(set) public var titleLbl: String
    
    init(scoreImg: String,
         titleLbl: String) {
        
        self.scoreImg = scoreImg
        self.titleLbl = titleLbl
    }
    
}
