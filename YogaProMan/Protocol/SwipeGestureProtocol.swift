////
////  SwipeGestureProtocal.swift
////  Moving
////
////  Created by SYBM on 2018/11/1.
////  Copyright © 2019年 YaorongHuang. All rights reserved.
////

import Foundation
import UIKit

protocol SwipeGestureProtocol: AnyObject {
    
    func swipeGesture()
    
}

extension SwipeGestureProtocol where Self: UIViewController {
    
    func swipeGesture() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
}
