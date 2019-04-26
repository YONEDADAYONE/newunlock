//
//  InquiryViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/23.
//  Copyright © 2019 hiroya. All rights reserved.
//

import MessageUI
import UIKit

class InquiryViewController: UIViewController, MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        //if文がtrueだったら...
        if MFMailComposeViewController.canSendMail() {
            //定数mailでMFMailComposeViewControllerを継承
            let mail = MFMailComposeViewController()
            //デリゲート
            mail.mailComposeDelegate = self
            // 定数mailにプロパティに設定
            mail.setToRecipients(["yoneda.dayone8@gmail.co "]) // 宛先アドレス
            mail.setSubject("Feedback: heart's unlock") // 件名
            mail.setMessageBody("以下に、お問い合わせ内容をご記入ください。", isHTML: false) // 本文
            present(mail, animated: true, completion: nil)
        } else {
            print("送信できません")
        }
    }
    
    //終了処理の追加
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("キャンセル")
        case .saved:
            print("下書き保存")
        case .sent:
            print("送信成功")
        default:
            print("送信失敗")
        }
        dismiss(animated: true, completion: nil)
    }

}
