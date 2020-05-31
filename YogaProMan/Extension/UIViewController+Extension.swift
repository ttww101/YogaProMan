//
//  ViewController+Extension.swift
//  Moving
//
//  Created by SYBM on 2018/10/23.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
                navigationController?.popViewController(animated: true)
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
                
            default:
                break
            }
        }
    }
}
