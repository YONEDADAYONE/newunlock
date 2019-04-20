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
import Onboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    //https://qiita.com/ysk_1031/items/5c6c7163bd024313a197 ウォークスルー
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TWTRTwitter.sharedInstance().start(withConsumerKey: "dvFuLqd8Of56DVlVuBkMR42UC", consumerSecret:
            "T4nG1hmvPfHkUFDktPR1cBQTmao4yTPmIA2qbJCw2T3t0PgOJm")
        
        
        // UserDefaultsを使ってフラグを保持する
        let userDefault = UserDefaults.standard
        // "firstLaunch"をキーに、Bool型の値を保持する
        let dict = ["firstLaunch": true]
        // デフォルト値登録
        // ※すでに値が更新されていた場合は、更新後の値のままになる
        userDefault.register(defaults: dict)
        
        // "firstLaunch"に紐づく値がtrueなら(=初回起動)、値をfalseに更新して処理を行う
        if userDefault.bool(forKey: "firstLaunch") {
            userDefault.set(false, forKey: "firstLaunch")
            print("初回起動の時だけ呼ばれるよ")
            
            if true {
                let content1 = OnboardingContentViewController(
                    title: "welcome to「Heart's Unlock」",
                    body: "このアプリでは「やめたいこと」や「できないこと」から「新しい自分」を発見することができるアプリです。",
                    image: UIImage(named: "南京錠1"),
                    buttonText: "NEXT",
                    action: nil
                )
                let content2 = OnboardingContentViewController(
                    title: "何かが終わる時は何かが始まります",
                    body: "「やめたいこと」や「出来ない自分」を認めることは、素敵な出会いのキッカケとも言えるでしょう",
                    image: UIImage(named: "南京錠2"),
                    buttonText: "NEXT",
                    action: nil
                )
                let content3 = OnboardingContentViewController(
                    title: "新しい自分に生まれ変わるチャンスは、自分の中にあります。",
                    body: "さあ、「心の錠前」を外す旅に出かけてみましょう!",
                    image: UIImage(named: "南京錠3"),
                    buttonText: "NEXT",
                    action: {
                        let storyboard:UIStoryboard =  UIStoryboard(name: "Main",bundle:nil)
                        
                        self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "GotoQuestionViewController") as UIViewController
                }
                )
                
                //サイズ変更
                content1.titleLabel.font = UIFont.systemFont(ofSize: 18)
                content1.bodyLabel.font = UIFont.systemFont(ofSize: 14)
                
                content2.titleLabel.font = UIFont.systemFont(ofSize: 18)
                content2.bodyLabel.font = UIFont.systemFont(ofSize: 14)
                
                content3.titleLabel.font = UIFont.systemFont(ofSize: 18)
                content3.bodyLabel.font = UIFont.systemFont(ofSize: 14)
                
                //サイズ変更終了
                
//                let bgImageURL = NSURL(string: "https://www.pakutaso.com/shared/img/thumb/KAZ_hugyftdrftyg_TP_V.jpg")!
//                let bgImage = UIImage(data: NSData(contentsOf: bgImageURL as URL)! as Data)
                window?.backgroundColor = UIColor.red
               
                let vc = OnboardingViewController(
                    backgroundImage: nil,
                    contents: [content1, content2, content3]
                )
//                vc?.allowSkipping = true
//                vc?.skipHandler = { _ in
//                    print("skip")
//                    }
                window?.backgroundColor = UIColor.green
                
                window?.rootViewController = vc
                
            }
        }
        
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
