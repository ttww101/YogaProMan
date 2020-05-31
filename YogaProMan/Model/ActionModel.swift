//
//  ActionModel.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/21.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation

struct ActionModel: Equatable, Codable {
    
    private(set) public var youtubeTime: Double
    private(set) public var stopTime: Double
    private(set) public var timesDescription: Double
    private(set) public var actionDescription: String
    private(set) public var restTime: Double
    public var cellStatus: CellPlay
    public var actionOrRest: ActionOnOff
    public var playingOrPause: PlayingOnOff
    public var firstPlayAction: Bool = true
    public var firstPlayRest: Bool = true
    public var actionCellDidInvisiable: Bool = false
    public var restCellDidInvisiable: Bool = false
    
    init(youtubeTime: Double,
         stopTime: Double,
         restTime: Double,
         timesDescription: Double,
         actionDescription: String,
         cellStatus: CellPlay = CellPlay.willplay,
         actionOrRest: ActionOnOff = ActionOnOff.action,
         playingOrPause: PlayingOnOff = PlayingOnOff.playing,
         firstPlayAction: Bool = true,
         firstPlayRest: Bool = true,
         actionCellDidInvisiable: Bool = false,
         restCellDidInvisiable: Bool = false) {
        
        self.youtubeTime = youtubeTime
        self.stopTime = stopTime
        self.timesDescription = timesDescription
        self.actionDescription = actionDescription
        self.restTime = restTime
        self.cellStatus = cellStatus
        self.actionOrRest = actionOrRest
        self.playingOrPause = playingOrPause
        self.firstPlayAction = firstPlayAction
        self.firstPlayRest = firstPlayRest
        self.actionCellDidInvisiable = actionCellDidInvisiable
        self.restCellDidInvisiable = restCellDidInvisiable
    }
    
}
