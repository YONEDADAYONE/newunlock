//
//  ResultTableViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/21.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit
import RealmSwift

class ResultTableViewController: UITableViewController {

    var registrationString = String()
    var registrationString2 = String()
    var registrationString3 = String()
    var registrationString4 = String()
    var registrationString5 = String()
    
    let realm = try? Realm()
    //todo 名前変更すること
    let storageBox = StorageBox()
    var window: UIWindow?
    
    var storage = ""
    var storage2 = ""
    var storage3 = ""
    var storage4 = ""
    var storage5 = ""
    
    @IBOutlet weak var registrationCell1: UITableViewCell!
    @IBOutlet weak var registrationcell2: UITableViewCell!
    @IBOutlet weak var registrationCell3: UITableViewCell!
    @IBOutlet weak var regstrationCell4: UITableViewCell!
    @IBOutlet weak var regstrationCell5: UITableViewCell!
    
        override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registrationCell1.textLabel?.text = registrationString
        registrationcell2.textLabel?.text = registrationString2
        registrationCell3.textLabel?.text = registrationString3
        regstrationCell4.textLabel?.text = registrationString4
        regstrationCell5.textLabel?.text = registrationString5
        
        storage = registrationString
        storage2 = registrationString2
        storage3 = registrationString3
        storage4 = registrationString4
        storage5 = registrationString5
    }
    
    @IBAction func goToResRegistraion(_ sender: UIBarButtonItem) {

        
//        //プライマリーキーIDに1ずつ足す方法
//        //https://qiita.com/kotala_b/items/68b9608df6c8bac80f67
//        var maxId: Int? { return try? Realm().objects(StorageBox.self).sorted(byKeyPath: "id").last?.id ?? 0 }
//        storageBox.setValue(storageBox.id + 1, forKey: "id")
//        storageBox.id = maxId! + 1
//        storageBox.setValue(storage, forKey: "title")
//        storageBox.setValue(storage2, forKey: "Contents1")
//        storageBox.setValue(storage3, forKey: "Contents2")
//        storageBox.setValue(storage4, forKey: "Contents3")
//        storageBox.setValue(storage5, forKey: "Contents4")
//
//        print("知りたいのは\(storageBox)")
//
//        do {
//            //writeではテキストを指定したファイルに書き込むことができる。
//            //ここではrealmに書き込んでいる。
//            try realm?.write {
//                //の変数にデータを書き込んでいる。
//                realm?.add(storageBox)
//            }
//        } catch {
//            print(error)
//        }
        
        // ① UIAlertControllerクラスのインスタンスを生成
        // タイトル, メッセージ, Alertのスタイルを指定する
        // 第3引数のpreferredStyleでアラートの表示スタイルを指定する
        let alert: UIAlertController = UIAlertController(title: "保存してもよろしいですか？", message: nil, preferredStyle:  UIAlertController.Style.alert)
        
        // ② Actionの設定
        // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
        // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
            
            //プライマリーキーIDに1ずつ足す方法
            //https://qiita.com/kotala_b/items/68b9608df6c8bac80f67
            var maxId: Int? { return try? Realm().objects(StorageBox.self).sorted(byKeyPath: "id").last?.id ?? 0 }
            self.storageBox.setValue(self.storageBox.id + 1, forKey: "id")
            self.storageBox.id = maxId! + 1
            self.storageBox.setValue(self.storage, forKey: "title")
            self.storageBox.setValue(self.storage2, forKey: "Contents1")
            self.storageBox.setValue(self.storage3, forKey: "Contents2")
            self.storageBox.setValue(self.storage4, forKey: "Contents3")
            self.storageBox.setValue(self.storage5, forKey: "Contents4")
            
            print("知りたいのは\(self.storageBox)")
            
            do {
                //writeではテキストを指定したファイルに書き込むことができる。
                //ここではrealmに書き込んでいる。
                try self.realm?.write {
                    //の変数にデータを書き込んでいる。
                    self.realm?.add(self.storageBox)
                }
            } catch {
                print(error)
            }
            
            self.prepare()
//            let actionSheet = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: UIAlertController.Style.actionSheet)
//
//            let action1 = UIAlertAction(title: "アクション１", style: UIAlertAction.Style.default, handler: {
//                (action: UIAlertAction!) in
////                //storyboard上に配置したVCへ遷移Swift
//                self.prepare()
//            })
            
//            let action2 = UIAlertAction(title: "アクション２", style: UIAlertAction.Style.default, handler: {
//                (action: UIAlertAction!) in
//                print("アクション２をタップした時の処理")
//            })
//
//            let action3 = UIAlertAction(title: "アクション３", style: UIAlertAction.Style.destructive, handler: {
//                (action: UIAlertAction!) in
//                print("アクション３をタップした時の処理")
//            })
            
//            let cancel = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {
//                (action: UIAlertAction!) in
//                print("キャンセルをタップした時の処理")
//            })
            
//            actionSheet.addAction(action1)
//            actionSheet.addAction(action2)
//            actionSheet.addAction(action3)
//            actionSheet.addAction(cancel)
//
//            self.present(actionSheet, animated: true, completion: nil)
            
            
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
    }
    
    //http://saruhei1989.hatenablog.com/entry/2015/09/08/190000_1
    func prepare() {
        // 処理を実行したいsegueを指定
            //遷移先のインスタンスをsegueから取り出す
        self.performSegue(withIdentifier: "segu", sender: self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // それぞれのセクション毎に何行のセルがあるかを返します
        switch section {
        case 0: // 「設定」のセクション に返すcellの数
            return 1
        case 1: // 「その他」のセクション に返すcellの数。今回の場合アプリバージョンとライセンスの二つをか返したいから2になる。
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        default: // ここが実行されることはないはず
            return 0
        }
    
        
    }
    
//    override func prepare(for seguemon: UIStoryboardSegue, sender: Any?)
//    {
//        let ListViewController = seguemon.destination as! ListViewController
//        ListViewController.myString13 = registrationString
//        ListViewController.myString14 = registrationString2
//        ListViewController.myString15 = registrationString3
//        ListViewController.myString16 = registrationString4
//        ListViewController.myString17 = registrationString5
//    }

}



//class resultViewController: UIViewController {
//
//
//
//    @IBOutlet weak var resultLabel1: UILabel!
//    @IBOutlet weak var resultLabel2: UILabel!
//    @IBOutlet weak var resultLabel3: UILabel!
//    @IBOutlet weak var resultLabel4: UILabel!
//
//    let realm = try? Realm()
//    //todo 名前変更すること
//    let storageBox = TrTodo()
//
//    var storage = ""
//    var storage2 = ""
//    var storage3 = ""
//    var storage4 = ""
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        resultLabel1.text = myString9
//        resultLabel2.text = myString10
//        resultLabel3.text = myString11
//        resultLabel4.text = myString12
//
//        print(Realm.Configuration.defaultConfiguration.fileURL ?? "")
//    }
//
//    @IBAction func enter5(_ sender: Any)
//    {
//        storage = myString9
//        storage2 = myString10
//        storage3 = myString11
//        storage4 = myString12
//
//        //プライマリーキーIDに1ずつ足す方法
//        //https://qiita.com/kotala_b/items/68b9608df6c8bac80f67
//        var maxId: Int? { return try? Realm().objects(TrTodo.self).sorted(byKeyPath: "id").last?.id ?? 0 }
//        storageBox.setValue(storageBox.id + 1, forKey: "id")
//        storageBox.id = maxId! + 1
//        storageBox.setValue(storage, forKey: "title")
//        storageBox.setValue(storage2, forKey: "Contents1")
//        storageBox.setValue(storage3, forKey: "Contents2")
//        storageBox.setValue(storage4, forKey: "Contents3")
//
//        do {
//            //writeではテキストを指定したファイルに書き込むことができる。
//            //ここではrealmに書き込んでいる。
//            try realm?.write {
//                //の変数にデータを書き込んでいる。
//                realm?.add(storageBox)
//            }
//        } catch {
//            print(error)
//        }
//
//        performSegue(withIdentifier: "seguemon", sender: self)
//    }
//
//
//
//}

