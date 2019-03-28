//
//  AppDelegate.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/20.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import TwitterCore
import TwitterKit
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        return false
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TWTRTwitter.sharedInstance().start(withConsumerKey: "dvFuLqd8Of56DVlVuBkMR42UC", consumerSecret:
            "T4nG1hmvPfHkUFDktPR1cBQTmao4yTPmIA2qbJCw2T3t0PgOJm")
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}
