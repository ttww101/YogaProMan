//
//  Data.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/20.
//  Copyright © 2019年 YaorongHuang. All rights reserved.

//swiftlint:disable comma
//swiftlint:disable line_length
//swiftlint:trailing_comma
//swiftlint:vertical_whitespace

import Foundation
class LocalDataBase {
    
    static let instance = LocalDataBase()
    private init() {}
    
    private let fitCategories = [
        
        FitnessModel(title: "全部教程", imageName: "1", secondTitle: "All Yoga"),
        FitnessModel(title: "初级瑜珈", imageName: "2", secondTitle: "Primary"),
        FitnessModel(title: "进阶瑜珈", imageName: "4", secondTitle: "Advanced"),
        FitnessModel(title: "孕妇瑜珈", imageName: "5", secondTitle: "Pregnancy")
        
    ]
    
    private let allArray = [
        
        NewListModel(videoImg: "primary1", durationLbl: 7, videoTitle: "七分钟瑜珈暖身", videoDescription: "Warm Up Yoga", intensity: "入门", videoID: "wmX62pOOSw4", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 16, stopTime: 60, restTime: 0, timesDescription: 60, actionDescription: "手部暖身", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 77, stopTime: 52, restTime: 3, timesDescription: 52, actionDescription: "背部拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 130, stopTime: 80, restTime: 3, timesDescription: 80, actionDescription: "猫式暖身", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 211, stopTime: 54, restTime: 3, timesDescription: 54, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 266, stopTime: 66, restTime: 3, timesDescription: 66, actionDescription: "上身拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 333, stopTime: 68, restTime: 3, timesDescription: 68, actionDescription: "扭转", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 402, stopTime: 34, restTime: 3, timesDescription: 34, actionDescription: "臀部", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .primary),
        
        NewListModel(videoImg: "primary2", durationLbl: 8, videoTitle: "8分钟睡前瑜伽", videoDescription: "Yoga for Bedtime", intensity: "入门", videoID: "RPLm5Bi4B_E", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 32, stopTime: 55, restTime: 0, timesDescription: 55, actionDescription: "呼吸放松", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 88, stopTime: 66, restTime: 0, timesDescription: 66, actionDescription: "束脚式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 155, stopTime: 101, restTime: 0, timesDescription: 101, actionDescription: "大腿拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 257, stopTime: 41, restTime: 0, timesDescription: 41, actionDescription: "下背拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 299, stopTime: 28, restTime: 0, timesDescription: 28, actionDescription: "扭转", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 328, stopTime: 126, restTime: 0, timesDescription: 126, actionDescription: "大腿外侧拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 455, stopTime: 57, restTime: 0, timesDescription: 57, actionDescription: "抬腿", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .primary),
        
        NewListModel(videoImg: "primary3", durationLbl: 8, videoTitle: "排毒瑜伽", videoDescription: "Detox Yoga", intensity: "入门", videoID: "8SjT0NF2sWw", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 40, stopTime: 78, restTime: 0, timesDescription: 78, actionDescription: "扭转1", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 119, stopTime: 76, restTime: 0, timesDescription: 76, actionDescription: "扭转2", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 196, stopTime: 67, restTime: 0, timesDescription: 67, actionDescription: "扭转3", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 264, stopTime: 44, restTime: 0, timesDescription: 44, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 309, stopTime: 110, restTime: 0, timesDescription: 110, actionDescription: "扭转4", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 420, stopTime: 84, restTime: 0, timesDescription: 84, actionDescription: "扭转5", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 505, stopTime: 15, restTime: 0, timesDescription: 15, actionDescription: "下背拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .primary),
        
        NewListModel(videoImg: "advanced1", durationLbl: 5, videoTitle: "最美瑜伽鸽子式", videoDescription: "Pigeon Yoga Pose", intensity: "中等", videoID: "KO8Qx2-dmDg", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 112, stopTime: 65, restTime: 3, timesDescription: 65, actionDescription: "简易版"),
            
            NewActionModel(youtubeTime: 178, stopTime: 124, restTime: 3, timesDescription: 124, actionDescription: "右侧鸽子式"),
            
            NewActionModel(youtubeTime: 303, stopTime: 109, restTime: 3, timesDescription: 109, actionDescription: "左侧鸽子式")
            
            ], category: .advanced),
        
        NewListModel(videoImg: "advanced2", durationLbl: 8, videoTitle: "燃脂瑜伽", videoDescription: "Yoga for Arm", intensity: "中等", videoID: "txplbOWk4wk", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 63, stopTime: 49, restTime: 0, timesDescription: 49, actionDescription: "手脚平举", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 113, stopTime: 32, restTime: 0, timesDescription: 32, actionDescription: "平板和下犬", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 146, stopTime: 79, restTime: 0, timesDescription: 79, actionDescription: "cobra", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 226, stopTime: 80, restTime: 0, timesDescription: 80, actionDescription: "核心", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 307, stopTime: 82, restTime: 0, timesDescription: 82, actionDescription: "侧平板", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 390, stopTime: 51, restTime: 0, timesDescription: 51, actionDescription: "核心2", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 442, stopTime: 101, restTime: 0, timesDescription: 101, actionDescription: "桌子式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .advanced),
        
        NewListModel(videoImg: "advanced3", durationLbl: 9, videoTitle: "居家瑜珈演释", videoDescription: "进阶拜日式/英雄式/三角式", intensity: "中等", videoID: "gMjazvfdJK4", timeRange: TimeLength.min9, actionModel: [
            
            NewActionModel(youtubeTime: 5, stopTime: 34, restTime: 0, timesDescription: 34, actionDescription: "基本式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 40, stopTime: 49, restTime: 0, timesDescription: 49, actionDescription: "放松", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 90, stopTime: 41, restTime: 0, timesDescription: 41, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 132, stopTime: 63, restTime: 0, timesDescription: 63, actionDescription: "进阶式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 196, stopTime: 37, restTime: 0, timesDescription: 37, actionDescription: "进阶式2", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 234, stopTime: 53, restTime: 0, timesDescription: 53, actionDescription: "英雄式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 288, stopTime: 39, restTime: 0, timesDescription: 39, actionDescription: "三角式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 328, stopTime: 21, restTime: 0, timesDescription: 21, actionDescription: "侧边延展式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 350, stopTime: 44, restTime: 0, timesDescription: 44, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 395, stopTime: 58, restTime: 0, timesDescription: 58, actionDescription: "英雄式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 454, stopTime: 34, restTime: 0, timesDescription: 34, actionDescription: "三角式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 489, stopTime: 56, restTime: 0, timesDescription: 56, actionDescription: "侧边延展式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .advanced),
        
        NewListModel(videoImg: "pregnancy1", durationLbl: 6, videoTitle: "孕妇瑜珈轻轻伸展", videoDescription: "给胎儿满满的安心感", intensity: "入门", videoID: "u4h5vVPSZuc", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 25, stopTime: 60, restTime: 6, timesDescription: 60, actionDescription: "初期-侧腰伸展"),
            
            NewActionModel(youtubeTime: 97, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "初期-单脚前弯腿部伸展"),
            
            NewActionModel(youtubeTime: 160, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "中期-膝盖开合练习"),
            
            NewActionModel(youtubeTime: 229, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "中期-大腿延展练习"),
            
            NewActionModel(youtubeTime: 274, stopTime: 60, restTime: 9, timesDescription: 60, actionDescription: "后期-扩胸运动"),
            
            NewActionModel(youtubeTime: 349, stopTime: 60, restTime: 7, timesDescription: 60, actionDescription: "后期-半桥式")
            
            ], category: .pregnancy),
        
        NewListModel(videoImg: "pregnancy2", durationLbl: 7, videoTitle: "孕妇瑜珈", videoDescription: "舒缓腰酸背痛", intensity: "入门", videoID: "qs7PdUgGsw0", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 13, stopTime: 110, restTime: 3, timesDescription: 120, actionDescription: "肩膀伸展", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 131, stopTime: 210, restTime: 3, timesDescription: 180, actionDescription: "猫牛伸展", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 405, stopTime: 115, restTime: 3, timesDescription: 120, actionDescription: "凯格尔运动", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .pregnancy),
        
        NewListModel(videoImg: "pregnancy3", durationLbl: 7, videoTitle: "适合所有孕妈咪的练习", videoDescription: "孕妇瑜珈" , intensity: "入门", videoID: "npAFyDFpM0M", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 116, stopTime: 120, restTime: 5, timesDescription: 120, actionDescription: "静坐呼吸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 256, stopTime: 85, restTime: 3, timesDescription: 90, actionDescription: "颈部伸展", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 345, stopTime: 82, restTime: 8, timesDescription: 90, actionDescription: "消除水肿", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 462, stopTime: 111, restTime: 10, timesDescription: 120, actionDescription: "减少抽筋、改善水肿", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .pregnancy)
        
    ]
    
    private let primaryArray = [
        
        NewListModel(videoImg: "primary1", durationLbl: 7, videoTitle: "七分钟瑜珈暖身", videoDescription: "Warm Up Yoga", intensity: "入门", videoID: "wmX62pOOSw4", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 16, stopTime: 60, restTime: 0, timesDescription: 60, actionDescription: "手部暖身", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 77, stopTime: 52, restTime: 3, timesDescription: 52, actionDescription: "背部拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 130, stopTime: 80, restTime: 3, timesDescription: 80, actionDescription: "猫式暖身", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 211, stopTime: 54, restTime: 3, timesDescription: 54, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 266, stopTime: 66, restTime: 3, timesDescription: 66, actionDescription: "上身拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 333, stopTime: 68, restTime: 3, timesDescription: 68, actionDescription: "扭转", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 402, stopTime: 34, restTime: 3, timesDescription: 34, actionDescription: "臀部", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .primary),
        
        NewListModel(videoImg: "primary2", durationLbl: 8, videoTitle: "8分钟睡前瑜伽", videoDescription: "Yoga for Bedtime", intensity: "入门", videoID: "RPLm5Bi4B_E", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 32, stopTime: 55, restTime: 0, timesDescription: 55, actionDescription: "呼吸放松", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 88, stopTime: 66, restTime: 0, timesDescription: 66, actionDescription: "束脚式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 155, stopTime: 101, restTime: 0, timesDescription: 101, actionDescription: "大腿拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 257, stopTime: 41, restTime: 0, timesDescription: 41, actionDescription: "下背拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 299, stopTime: 28, restTime: 0, timesDescription: 28, actionDescription: "扭转", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 328, stopTime: 126, restTime: 0, timesDescription: 126, actionDescription: "大腿外侧拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 455, stopTime: 57, restTime: 0, timesDescription: 57, actionDescription: "抬腿", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .primary),
        
        NewListModel(videoImg: "primary3", durationLbl: 8, videoTitle: "排毒瑜伽", videoDescription: "Detox Yoga", intensity: "入门", videoID: "8SjT0NF2sWw", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 40, stopTime: 78, restTime: 0, timesDescription: 78, actionDescription: "扭转1", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 119, stopTime: 76, restTime: 0, timesDescription: 76, actionDescription: "扭转2", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 196, stopTime: 67, restTime: 0, timesDescription: 67, actionDescription: "扭转3", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 264, stopTime: 44, restTime: 0, timesDescription: 44, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 309, stopTime: 110, restTime: 0, timesDescription: 110, actionDescription: "扭转4", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 420, stopTime: 84, restTime: 0, timesDescription: 84, actionDescription: "扭转5", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 505, stopTime: 15, restTime: 0, timesDescription: 15, actionDescription: "下背拉伸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .primary)
        
    ]
    
    private let advancedArray = [
        NewListModel(videoImg: "advanced1", durationLbl: 5, videoTitle: "最美瑜伽鸽子式", videoDescription: "Pigeon Yoga Pose", intensity: "中等", videoID: "KO8Qx2-dmDg", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 112, stopTime: 65, restTime: 3, timesDescription: 65, actionDescription: "简易版"),
            
            NewActionModel(youtubeTime: 178, stopTime: 124, restTime: 3, timesDescription: 124, actionDescription: "右侧鸽子式"),
            
            NewActionModel(youtubeTime: 303, stopTime: 109, restTime: 3, timesDescription: 109, actionDescription: "左侧鸽子式")
            
            ], category: .advanced),
        
        NewListModel(videoImg: "advanced2", durationLbl: 8, videoTitle: "燃脂瑜伽", videoDescription: "Yoga for Arm", intensity: "中等", videoID: "txplbOWk4wk", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 63, stopTime: 49, restTime: 0, timesDescription: 49, actionDescription: "手脚平举", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 113, stopTime: 32, restTime: 0, timesDescription: 32, actionDescription: "平板和下犬", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 146, stopTime: 79, restTime: 0, timesDescription: 79, actionDescription: "cobra", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 226, stopTime: 80, restTime: 0, timesDescription: 80, actionDescription: "核心", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 307, stopTime: 82, restTime: 0, timesDescription: 82, actionDescription: "侧平板", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 390, stopTime: 51, restTime: 0, timesDescription: 51, actionDescription: "核心2", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 442, stopTime: 101, restTime: 0, timesDescription: 101, actionDescription: "桌子式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .advanced),
        
        NewListModel(videoImg: "advanced3", durationLbl: 9, videoTitle: "居家瑜珈演释", videoDescription: "进阶拜日式/英雄式/三角式", intensity: "中等", videoID: "gMjazvfdJK4", timeRange: TimeLength.min9, actionModel: [
            
            NewActionModel(youtubeTime: 5, stopTime: 34, restTime: 0, timesDescription: 34, actionDescription: "基本式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 40, stopTime: 49, restTime: 0, timesDescription: 49, actionDescription: "放松", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 90, stopTime: 41, restTime: 0, timesDescription: 41, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 132, stopTime: 63, restTime: 0, timesDescription: 63, actionDescription: "进阶式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 196, stopTime: 37, restTime: 0, timesDescription: 37, actionDescription: "进阶式2", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 234, stopTime: 53, restTime: 0, timesDescription: 53, actionDescription: "英雄式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 288, stopTime: 39, restTime: 0, timesDescription: 39, actionDescription: "三角式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 328, stopTime: 21, restTime: 0, timesDescription: 21, actionDescription: "侧边延展式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 350, stopTime: 44, restTime: 0, timesDescription: 44, actionDescription: "下犬式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 395, stopTime: 58, restTime: 0, timesDescription: 58, actionDescription: "英雄式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 454, stopTime: 34, restTime: 0, timesDescription: 34, actionDescription: "三角式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 489, stopTime: 56, restTime: 0, timesDescription: 56, actionDescription: "侧边延展式", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .advanced)
        
    ]
    
    private let pregnancyArray = [
        
        NewListModel(videoImg: "pregnancy1", durationLbl: 6, videoTitle: "孕妇瑜珈轻轻伸展", videoDescription: "给胎儿满满的安心感", intensity: "入门", videoID: "u4h5vVPSZuc", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 25, stopTime: 60, restTime: 6, timesDescription: 60, actionDescription: "初期-侧腰伸展"),
            
            NewActionModel(youtubeTime: 97, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "初期-单脚前弯腿部伸展"),
            
            NewActionModel(youtubeTime: 160, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "中期-膝盖开合练习"),
            
            NewActionModel(youtubeTime: 229, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "中期-大腿延展练习"),
            
            NewActionModel(youtubeTime: 274, stopTime: 60, restTime: 9, timesDescription: 60, actionDescription: "后期-扩胸运动"),
            
            NewActionModel(youtubeTime: 349, stopTime: 60, restTime: 7, timesDescription: 60, actionDescription: "后期-半桥式")
            
            ], category: .pregnancy),
        
        NewListModel(videoImg: "pregnancy2", durationLbl: 7, videoTitle: "孕妇瑜珈", videoDescription: "舒缓腰酸背痛", intensity: "入门", videoID: "qs7PdUgGsw0", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 13, stopTime: 110, restTime: 3, timesDescription: 120, actionDescription: "肩膀伸展", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 131, stopTime: 210, restTime: 3, timesDescription: 180, actionDescription: "猫牛伸展", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 405, stopTime: 115, restTime: 3, timesDescription: 120, actionDescription: "凯格尔运动", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .pregnancy),
        
        NewListModel(videoImg: "pregnancy3", durationLbl: 7, videoTitle: "适合所有孕妈咪的练习", videoDescription: "孕妇瑜珈" , intensity: "入门", videoID: "npAFyDFpM0M", timeRange: TimeLength.threeToNine, actionModel: [
            
            NewActionModel(youtubeTime: 116, stopTime: 120, restTime: 5, timesDescription: 120, actionDescription: "静坐呼吸", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 256, stopTime: 85, restTime: 3, timesDescription: 90, actionDescription: "颈部伸展", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 345, stopTime: 82, restTime: 8, timesDescription: 90, actionDescription: "消除水肿", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            NewActionModel(youtubeTime: 462, stopTime: 111, restTime: 10, timesDescription: 120, actionDescription: "减少抽筋、改善水肿", cellStatus: CellPlay.willplay, actionOrRest: ActionOnOff.action, playingOrPause: PlayingOnOff.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ], category: .pregnancy)
        
    ]
    
    private let scoreArray = [
        ScoreModel(scoreImg: "score_1", titleLbl: "轻松"),ScoreModel(scoreImg: "score_2", titleLbl: "适中"),ScoreModel(scoreImg: "score_3", titleLbl: "挑战级"),ScoreModel(scoreImg: "score_4", titleLbl: "极为吃力")
    ]
    
    private let settingArray = [
        
        SettingModel(titleLbl: "关于瑜珈达人", statusLbl: ""),
        SettingModel(titleLbl: "意见回馈", statusLbl: ""),
        SettingModel(titleLbl: "评分鼓励", statusLbl: ""),
        SettingModel(titleLbl: "每日运动推播", statusLbl: "尚未设定")
        
    ]
    
    private let settingSwitchArray = [
        
        SettingSwitchModel(titleLbl: "提示音设定", statusSwitch: false),
        SettingSwitchModel(titleLbl: "Apple Health", statusSwitch: false)
        
    ]
    
    private let workout = [ListModel]()
    
    func getfitCategories() -> [FitnessModel] {
        return fitCategories
    }
    
    func getList(forListTitle title: String) -> [NewListModel] {
        switch title {
        case "All Yoga":
            return getCore()
        case "Primary":
            return getPrimary()
        case "Advanced":
            return getAdvanced()
        case "Pregnancy":
            return getPregnancy()
            
        default:
            return getCore()
        }
    }
    
    func getCore() -> [NewListModel] {
        return allArray
    }
    
    func getPrimary() -> [NewListModel] {
        return primaryArray
    }
    
    func getAdvanced() -> [NewListModel] {
        return advancedArray
    }
    
    func getPregnancy() -> [NewListModel] {
        return pregnancyArray
    }
    
    func getScoreArray() -> [ScoreModel] {
        return scoreArray
    }
    
    func getSettingArray() -> [SettingModel] {
        return settingArray
    }
    
    func getSettingSwitchArray() -> [SettingSwitchModel] {
        return settingSwitchArray
    }
    
}
