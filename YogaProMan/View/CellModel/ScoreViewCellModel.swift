//
//  ScoreCollectionViewCellModel.swift
//  Moving
//
//  Created by SYBM on 2018/11/5.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct ScoreViewCellModel {
    
    private(set) public var scoreImg: String
    private(set) public var titleLbl: String
    
    init(scoreModel: ScoreModel) {
        
        self.scoreImg = scoreModel.scoreImg
        self.titleLbl = scoreModel.titleLbl
        
    }
    
}
