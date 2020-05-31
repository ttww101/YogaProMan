//
//  NewListModel.swift
//  Moving
//
//  Created by SYBM on 2018/11/27.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct NewListModel: Codable {
    
    private(set) public var videoImg: String
    private(set) public var durationLbl: Int
    private(set) public var videoTitle: String
    private(set) public var videoDescription: String
    private(set) public var videoID: String
    private(set) public var intensity: String
    private(set) public var timeRange: TimeLength
    private(set) public var actionModel: [NewActionModel]
    private(set) public var category: Category
    
    init(videoImg: String,
         durationLbl: Int,
         videoTitle: String,
         videoDescription: String,
         intensity: String,
         videoID: String,
         timeRange: TimeLength,
         actionModel: [NewActionModel],
         category: Category
        ) {
        
        self.videoImg = videoImg
        self.durationLbl = durationLbl
        self.videoTitle = videoTitle
        self.videoDescription = videoDescription
        self.intensity = intensity
        self.actionModel = actionModel
        self.videoID = videoID
        self.timeRange = timeRange
        self.category = category
    }
    
}
