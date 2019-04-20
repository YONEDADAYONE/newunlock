//
//  Alarm.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/17.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UserNotifications
import Foundation
import AVFoundation
//AVFoundationは、音声・動画などのメディアの再生や作成、編集を行うことの出来る巨大なフレームワークです。
//https://dev.classmethod.jp/smartphone/ios-avfundation/

class Alarm{
    var selectedWakeUpTime:Date?
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer?
    var seconds = 0
    
    //アラーム/タイマーを開始
    func runTimer(){
        //calculateIntervalにユーザーが入力した日付を渡す、返り値をsecondsに代入
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        guard sleepTimer == nil else { return }
        if sleepTimer == nil{
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            //米田
            self.setNotificationAftrer(second: seconds)
        }
    }
    
    //自作関数だよ! 一回保留　米田
    func setNotificationAftrer(second:Int) {
        // Notification のインスタンスを作成
        let content = UNMutableNotificationContent()
        
        
        //通知のタイトル本文の設定
        content.title = "お知らせします"
        content.body = "指定した時刻になりました"
        
        //        //音設定
        content.sound = UNNotificationSound.default
        
        //バックグラウンドだよ
        
        //トリガー設定
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: TimeInterval(second), repeats: false)
        
        //リクエスト 復習
        let request = UNNotificationRequest.init(identifier: "ID_AfterSecOnce", content: content, trigger: trigger)
        
        //通知のセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
    }
    
    //一秒ごとにsleepTimerに呼ばれる
    @objc private func updateTimer(){
        if seconds != 0{
            //secondsから-1する
            seconds -= 1
        }else{
            sleepTimer?.invalidate()
            sleepTimer = nil
            let soundFilePath = Bundle.main.path(forResource: "のど自慢のベルの音", ofType: "mp3")!
            let sound:URL = URL(fileURLWithPath: soundFilePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
                //Swift4
                //try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
                //Swift 4.2
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Cannot load file")
            }
            audioPlayer.play()
            print(audioPlayer.isPlaying)
        }
    }
    
    func stopTimer(){
        //sleepTimerがnilじゃない場合
        if sleepTimer != nil {
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
        }else{
            //タイマーを止める
            audioPlayer.stop()
        }
    }
    
    //起きる時間までの秒数を計算
    private func calculateInterval(userAwakeTime:Date)-> Int{
        //タイマーの時間を計算する
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        
        if interval < 0{
            //落とし穴 ②の解決策
            interval = 86400 - (0 - interval)
        }
        //落とし穴 ③の解決策
        let calendar =  Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
}
