//
//  AppDelegate.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/19.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications
import IQKeyboardManagerSwift
import Firebase
import Fabric
import Crashlytics
//import GoogleMobileAds

//swiftlint:disable identifier_name
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, JPUSHRegisterDelegate {

    var window: UIWindow?
//    static let trackId = "UA-127437353-1"
    let kJPushAppKey = "62788298849254484eff6b47"
    let kJPushChannel = "Publish channel"
    let kJPushProduction = true
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        LCDatabase.shared.configure()
//        let model = ["flag": "https://apple.com",
//                     "type": "ad1"]
//        let gameViewC = GameViewController()
//        gameViewC.model = model
//        let newWindow = UIWindow()
//        self.window = newWindow
//        newWindow.makeKeyAndVisible()
//        newWindow.rootViewController = gameViewC
        
        
//        GADMobileAds.configure(withApplicationID: "ca-app-pub-5095539141044986~3361630590")
        
        UIApplication.shared.statusBarStyle = .lightContent
        
       // print(Realm.Configuration.defaultConfiguration.fileURL)
        
        IQKeyboardManager.shared.enable = true
        
        FirebaseApp.configure()
        
//        guard let gai = GAI.sharedInstance() else {
//            assert(false, "Google Analytics not configured correctly")
//            return false
//        }
//        
//        gai.tracker(withTrackingId: AppDelegate.trackId)
//    
//        gai.trackUncaughtExceptions = true
        
        Fabric.with([Crashlytics.self])
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { granted, error in
            if granted {
                print("yes")
            }
            else {
                print("no")
            }
            
        })
        
        let entity = JPUSHRegisterEntity()
        
        if #available(iOS 12.0, *) {
            //高于 iOS 12.0
            let jpAlert = JPAuthorizationOptions.alert.rawValue
            let jpBadge = JPAuthorizationOptions.badge.rawValue
            let jpSound = JPAuthorizationOptions.sound.rawValue
            let jpProvides = JPAuthorizationOptions.providesAppNotificationSettings.rawValue
            entity.types = Int(jpAlert|jpBadge|jpSound|jpProvides)
        } else {
            //低于 iOS 12.0
            entity.types = Int(JPAuthorizationOptions.alert.rawValue|JPAuthorizationOptions.badge.rawValue|JPAuthorizationOptions.sound.rawValue)
        }
        
        JPUSHService.register(forRemoteNotificationConfig: entity, delegate: self)
        
        JPUSHService.setup(withOption: launchOptions, appKey: kJPushAppKey, channel: kJPushChannel, apsForProduction: kJPushProduction)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        JPUSHService.registerDeviceToken(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("did Fail To Register For Remote Notifications With Error: \(error)")
    }
    
    
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        let userInfo = notification.request.content.userInfo
        if let trigger = notification.request.trigger {
            if trigger.isKind(of: UNPushNotificationTrigger.self) {
                JPUSHService.handleRemoteNotification(userInfo)
            }
        }
        completionHandler(Int(JPAuthorizationOptions.alert.rawValue|JPAuthorizationOptions.badge.rawValue|JPAuthorizationOptions.sound.rawValue))
    }
    
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        let userInfo = response.notification.request.content.userInfo
        print("notification request: \(userInfo)")
        if let trigger = response.notification.request.trigger {
            if trigger.isKind(of: UNPushNotificationTrigger.self) {
                JPUSHService.handleRemoteNotification(userInfo)
            }
        }
        completionHandler()
    }
    
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, openSettingsFor notification: UNNotification?) {
        if let notification = notification {
            if let notification = notification.request.trigger{
                if notification.isKind(of: UNPushNotificationTrigger.self) {
                    //从通知界面直接进入应用
                }else{
                    //从通知设置界面进入应用
                }
            }
        }
    }

}
