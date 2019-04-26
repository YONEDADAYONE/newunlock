//
//  resultViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/23.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit
import RealmSwift

class resultViewController: UIViewController {

    var myString9 = String()
    var myString10 = String()
    var myString11 = String()
    var myString12 = String()
    
    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    @IBOutlet weak var resultLabel3: UILabel!
    @IBOutlet weak var resultLabel4: UILabel!
    
    let realm = try? Realm()
    //todo 名前変更すること
    let storageBox = StorageBox()
    
    var storage = ""
    var storage2 = ""
    var storage3 = ""
    var storage4 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel1.text = myString9
        resultLabel2.text = myString10
        resultLabel3.text = myString11
        resultLabel4.text = myString12
        
        print(Realm.Configuration.defaultConfiguration.fileURL ?? "")
    }
    
    @IBAction func enter5(_ sender: Any)
    {
        storage = myString9
        storage2 = myString10
        storage3 = myString11
        storage4 = myString12
        
        //プライマリーキーIDに1ずつ足す方法
        //https://qiita.com/kotala_b/items/68b9608df6c8bac80f67
        var maxId: Int? { return try? Realm().objects(StorageBox.self).sorted(byKeyPath: "id").last?.id ?? 0 }
        storageBox.setValue(storageBox.id + 1, forKey: "id")
        storageBox.id = maxId! + 1
        storageBox.setValue(storage, forKey: "title")
        storageBox.setValue(storage2, forKey: "Contents1")
        storageBox.setValue(storage3, forKey: "Contents2")
        storageBox.setValue(storage4, forKey: "Contents3")

        do {
            //writeではテキストを指定したファイルに書き込むことができる。
            //ここではrealmに書き込んでいる。
            try realm?.write {
                //の変数にデータを書き込んでいる。
                realm?.add(storageBox)
            }
        } catch {
            print(error)
        }
        
        performSegue(withIdentifier: "seguemon", sender: self)
    }
    
    override func prepare(for seguemon: UIStoryboardSegue, sender: Any?)
    {
        let ListViewController = seguemon.destination as! ListViewController
        ListViewController.myString13 = myString9
        ListViewController.myString14 = myString10
        ListViewController.myString15 = myString11
        ListViewController.myString16 = myString12
    }

}
