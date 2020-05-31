//
//  CellPlayEnum.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/10/5.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation
//swiftlint:disable identifier_name

enum CellPlay: String, Codable {
    
    case played
    case playing
    case willplay
    
}

enum ActionOnOff: String, Codable {
    
    case action
    case rest
}

enum PlayingOnOff: String, Codable {
    
    case playing
    case pause
    
}

enum TimeLength: String, Codable {
    
    case max3
    case threeToNine
    case min9
    
}

enum EffectSound: String, Codable {
    
    case open
    case close
    
}

enum Category: String, Codable {
    
    case primary
    case pregnancy
    case advanced 
    
}
