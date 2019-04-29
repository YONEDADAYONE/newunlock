//
//  SettingsTableTableViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/07.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit
import MessageUI

class SettingsTableTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var inquiryLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            versionLabel.text = version
        }
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // それぞれのセクション毎に何行のセルがあるかを返します
        switch section {
        case 0: // 「設定」のセクション に返すcellの数
            return 1
        case 1: // 「その他」のセクション に返すcellの数。今回の場合アプリバージョンとライセンスの二つをか返したいから2になる。
            return 2
        default: // ここが実行されることはないはず
            return 0
        }
    }
    
    override func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        print("知りたいインデックパスの行は\(indexPath.row)です")
        print("知りたいナンバーオブセクションの数は\(numberOfSections(in: tableView))です")
        
        
        if indexPath.row == 1 && numberOfSections(in: tableView) == 2 {
            //if文がtrueだったら...
            if MFMailComposeViewController.canSendMail() {
                //定数mailでMFMailComposeViewControllerを継承
                let mail = MFMailComposeViewController()
                //デリゲート
                mail.mailComposeDelegate = self
                // 定数mailにプロパティに設定
                mail.setToRecipients(["yoneda.dayone8@gmail.co "]) // 宛先アドレス
                mail.setSubject("Feedback: Heart unlock") // 件名
                mail.setMessageBody("以下に、お問い合わせ内容をご記入ください。", isHTML: false) // 本文
                present(mail, animated: true, completion: nil)
            } else {
                print("送信できません")
            }
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

//    override func prepare(for segusegu: UIStoryboardSegue, sender: Any?)
//    {
//        if let selectedRow = listTableView2.indexPathForSelectedRow {
//            let controller = segusegu.destination as! ReviewViewController
//            print("セレクトは\(selectedRow.row)")
//            print("prepare")
//            controller.aaa = selectedRow.row
//        }
//    }

}
