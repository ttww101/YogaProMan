//
//  NotificationViewController.swift
//  FitnessProMan
//
//  Created by SYBM on 2019/07/1.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit
import UserNotifications
import IQKeyboardManagerSwift

class NotificationViewController: UIViewController {
    @IBOutlet weak var removeNotificationBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notificationTextView: UITextView!
    
    @IBAction func removeNotificationBtnWasPressed(_ sender: UIButton) {
        
        if UIApplication.shared.scheduledLocalNotifications?.count == 0 {
            
            navigationController?.popToRootViewController(animated: true)
        
        }
        
        UIApplication.shared.cancelAllLocalNotifications()
        removeNotificationBtn.setTitle("已关闭推播", for: .normal)
        
        let notificationName = Notification.Name("notificationUpdate")
        NotificationCenter.default.post(name: notificationName,
                                        object: nil,
                                        userInfo: ["timeString": "尚未设定"])
        
    }
    
    func showRemoveNotificationBtn() {
        
        UNUserNotificationCenter.current().getNotificationSettings { (_) in
            
            DispatchQueue.main.async {
                
                if UIApplication.shared.scheduledLocalNotifications?.count != 0 {
                    
                    self.removeNotificationBtn.borderWidth = 2
                    self.removeNotificationBtn.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    self.removeNotificationBtn.cornerRadius = 25
                    self.removeNotificationBtn.isHidden = false
                    
                } else {
                    
                    self.removeNotificationBtn.isHidden = true
                    
                }
            }
        }
    }
    
    @IBAction func okBtn(_ sender: Any) {
        
        let dateHHValue = DateFormatter()
        dateHHValue.dateFormat = "HH"
        let hourString = dateHHValue.string(from: datePicker.date)
        print(hourString)
        
        let dateMMValue = DateFormatter()
        dateMMValue.dateFormat = "mm"
        let minString = dateMMValue.string(from: datePicker.date)
        print(minString)
        
        if notificationTextView.text == "" || notificationTextView!.text == "你想跟明天的自己说什么呢✍？"{
            
            scheduleNotification(hour: Int(hourString) ?? 0, minute: Int(minString) ?? 0, title: "该运动啰！")
            
         } else {
            
            let titleText = notificationTextView.text
            scheduleNotification(hour: Int(hourString) ?? 0,
                                 minute: Int(minString) ?? 0,
                                 title: titleText ?? "该运动啰！")
            
        }
        
        let notificationName = Notification.Name("notificationUpdate")
        NotificationCenter.default.post(name: notificationName,
                                        object: nil,
                                        userInfo: ["timeString": "\(hourString):\(minString)"])
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        okBtn.cornerRadius = 25
        datePicker.setValue(UIColor.white, forKey: "textColor")
        notificationTextView.layer.borderColor = UIColor.white.cgColor
        notificationTextView.layer.borderWidth = 1
        notificationTextView.clipsToBounds = true
        notificationTextView.layer.cornerRadius = 20
        
//        GAManager.createNormalScreenEventWith("NotificationViewController")
        
        showRemoveNotificationBtn()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.datePickerMode = .time
        notificationTextView.delegate = self
   
    }
    
    func scheduleNotification(hour: Int, minute: Int, title: String) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = "运动时间到啦🙋‍♀️"
        content.body = "坚持才能塑造自己的可能性"
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "eveydayNotification", content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request, withCompletionHandler: nil)
        
    }
    
}

extension NotificationViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        notificationTextView.text = ""
        return true
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    
    }
}
