//
//  SummaryModel.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/27.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation
import RealmSwift

class SummaryModel: Object {
    
    @objc dynamic var videoImg: String = ""
    @objc dynamic var durationLbl: Int = 0
    @objc dynamic var videoTitle: String = ""
    @objc dynamic var scoreTitleLbl: String = ""
    @objc dynamic var workoutDate: TimeInterval = 0.0
    
    convenience init(videoImg: String, durationLbl: Int, videoTitle: String,
                     scoreTitleLbl: String, workoutDate: TimeInterval) {
        self.init()
        self.videoImg = videoImg
        self.durationLbl = durationLbl
        self.videoTitle = videoTitle
        self.scoreTitleLbl = scoreTitleLbl
        self.workoutDate = workoutDate
    }
    
}
