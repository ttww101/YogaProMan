//
//  ActionViewCellModel.swift
//  Moving
//
//  Created by SYBM on 2018/11/5.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct ActionViewCellModel {
    
    private(set) public var youtubeTime: Double
    private(set) public var stopTime: Double
    private(set) public var timesDescription: Double
    private(set) public var actionDescription: String
    private(set) public var restTime: Double
    private(set) public var cellStatus: CellPlay
    private(set) public var actionOrRest: ActionOnOff
    private(set) public var playingOrPause: PlayingOnOff
    private(set) public var firstPlayAction: Bool = true
    private(set) public var firstPlayRest: Bool = true
    private(set) public var actionCellDidInvisiable: Bool = false
    private(set) public var restCellDidInvisiable: Bool = false
    
    init(actionModel: NewActionModel) {
        
        self.youtubeTime = actionModel.youtubeTime
        self.stopTime = actionModel.stopTime
        self.timesDescription = actionModel.timesDescription
        self.actionDescription = actionModel.actionDescription
        self.restTime = actionModel.restTime
        self.cellStatus = actionModel.cellStatus
        self.actionOrRest = actionModel.actionOrRest
        self.playingOrPause = actionModel.playingOrPause
        self.firstPlayAction = actionModel.firstPlayAction
        self.firstPlayRest = actionModel.firstPlayRest
        self.actionCellDidInvisiable = actionModel.actionCellDidInvisiable
        self.restCellDidInvisiable = actionModel.restCellDidInvisiable
        
    }
    
}
