//
//  SetViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/17.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    //クラス:Alarmを継承
    let alarm = Alarm()
    
    @IBOutlet var sleepTimePicker: UIDatePicker!
    
    var myString13 = String()
    var myString14 = String()
    var myString15 = String()
    var myString16 = String()
    var myString17 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIDatePickerを.timeモードにする
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        //現在の時間をDatePickerに表示
        sleepTimePicker.setDate(Date(), animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        alarm.selectedWakeUpTime = sleepTimePicker.date
        alarm.runTimer()
        performSegue(withIdentifier: "setToSleeping", sender: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        //AlarmでsleepTimerがnilじゃない場合
//        if alarm.sleepTimer != nil{
//            //再生されているタイマーを止める
//            alarm.stopTimer()
//        }
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
