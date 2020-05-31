//
//  NotificationAuthProtocal.swift
//  Moving
//
//  Created by SYBM on 2018/11/1.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

protocol NotificationAuthProtocol: AnyObject {
    
    func notificationVCSwitch()
    
}

extension NotificationAuthProtocol where Self: UIViewController {
    
    func notificationVCSwitch() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let beforeNotificationViewController = storyboard.instantiateViewController(
            withIdentifier: "BeforeNotificationViewController") as? BeforeNotificationViewController else {return}
        
        guard let notificationVC = storyboard.instantiateViewController(
            withIdentifier: "NotificationViewController") as? NotificationViewController else {return}
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                
                if settings.authorizationStatus == .authorized {
                    
                    self.show(notificationVC, sender: nil)
                    
                } else {
                    
                    self.show(beforeNotificationViewController, sender: nil)
                    
                }
            }
        }
    }
    
}
