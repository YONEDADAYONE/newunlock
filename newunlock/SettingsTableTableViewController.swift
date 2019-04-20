//
//  SettingsTableTableViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/07.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit

class SettingsTableTableViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    
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
