//
//  LastResultTableViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/21.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit
import RealmSwift

class LastResultTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var registrationString = String()
    var registrationString2 = String()
    var registrationString3 = String()
    var registrationString4 = String()
    var registrationString5 = String()
    
    let realm = try? Realm()
        //todo 名前変更すること
    let storageBox = StorageBox()
    
    var storage = ""
    var storage2 = ""
    var storage3 = ""
    var storage4 = ""
    var storage5 = ""
    
    var sectionArray = [String]()
//    let myArray = [storage,storage2,storage3,storage4,storage5]
    
    var myArray = [String]()
    
    @IBOutlet weak var myTabeleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = registrationString
        storage2 = registrationString2
        storage3 = registrationString3
        storage4 = registrationString4
        storage5 = registrationString5
        
        myArray = [storage,storage2,storage3,storage4,storage5]
        sectionArray =  ["やめるもの", "それに至ったけキッカケや感情", "やめたことで新しく得られるもの", "やりたいこと", "メモ欄"]
        
    }
    
    //セクションの数を返す
    func numberOfSectionsInTableView(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    //セクションのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("知りたい\(sectionArray[section])")
//        return sectionArray[section]
        

        return sectionArray[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return storage.count
        }
        else if section == 1 {
            return storage2.count
        }
        else if section == 2 {
            return storage3.count
        }
        else if section == 3 {
            return storage4.count
        }
        else if section == 4 {
            return storage5.count
        }else {
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = myTabeleView.dequeueReusableCell(withIdentifier: "NameCell")
        
        if indexPath.section == 0 {
            cell.textLabel?.text = storage
        }else if indexPath.section == 1 {
            cell.textLabel?.text = storage2
        }else if indexPath.section == 2 {
            cell.textLabel?.text = storage3
        }else if indexPath.section == 3 {
            cell.textLabel?.text = storage4
        }else if indexPath.section == 4 {
            cell.textLabel?.text = storage4
        }
        return cell
    }
    
    
    
}


//import UIKit
//import RealmSwift
//
//class ResultTableViewController: UITableViewController {
//
//    var registrationString = String()
//    var registrationString2 = String()
//    var registrationString3 = String()
//    var registrationString4 = String()
//    var registrationString5 = String()
//
//    let realm = try? Realm()
//    //todo 名前変更すること
//    let storageBox = TrTodo()
//
//    var storage = ""
//    var storage2 = ""
//    var storage3 = ""
//    var storage4 = ""
//    var storage5 = ""
//
//    @IBOutlet weak var registrationCell1: UITableViewCell!
//    @IBOutlet weak var registrationcell2: UITableViewCell!
//    @IBOutlet weak var registrationCell3: UITableViewCell!
//    @IBOutlet weak var regstrationCell4: UITableViewCell!
//    @IBOutlet weak var regstrationCell5: UITableViewCell!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        registrationCell1.textLabel?.text = registrationString
//        registrationcell2.textLabel?.text = registrationString2
//        registrationCell3.textLabel?.text = registrationString3
//        regstrationCell4.textLabel?.text = registrationString4
//        regstrationCell5.textLabel?.text = registrationString5
//    }
//
//    // MARK: - Table view data source
//
//
//    @IBAction func goToResRegistraion(_ sender: UIBarButtonItem) {
//
//        storage = registrationString
//        storage2 = registrationString2
//        storage3 = registrationString3
//        storage4 = registrationString4
//        storage5 = registrationString5
//
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
//        storageBox.setValue(storage5, forKey: "Contents4")
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
//        //        performSegue(withIdentifier: "seguemon", sender: self)
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//}



//import UIKit
//
//class ViewController: UIViewController ,
//UITableViewDataSource, UITableViewDelegate {
//
//    @IBOutlet private var table: UITableView!
//    private var titleValueArray: NSArray?
//    private var subTitleArray: NSArray?
//    private var imagesArray: NSArray?
//    private var imagesArray2: NSArray?
//    private var imagesArray3: NSArray?
//
//    //セクション名
//    let sectionTitle: NSArray = ["セクション1", "セクション2", "セクション3"]
//
//    // Section数
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sectionTitle.count
//    }
//
//    // Sectionのタイトル
//    func tableView(_ tableView: UITableView,
//                   titleForHeaderInSection section: Int) -> String? {
//        return sectionTitle[section] as? String
//    }
//
//    //何行表示するのかを指定する。
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return imagesArray?.count ?? 0
//        } else if section == 1 {
//            return imagesArray2?.count ?? 0
//        } else if section == 2 {
//            return imagesArray3?.count ?? 0
//        } else {
//            return 0
//        }
//        //        return titleValueArray?.count ?? 0
//    }
//
//    //指定された行に(indexPath.row)に、どんな内容のセルを表示するかを指定する。
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        // tableCell の ID で UITableViewCell のインスタンスを生成
//        let cell = table.dequeueReusableCell(withIdentifier: "testCell",
//                                             for: indexPath)
//
//        //        let img = UIImage(named: (imagesArray?[indexPath.row] as? String ?? ""))
//        //
//        //        // Tag番号 1 で UIImageView インスタンスの生成
//        //        let imageView = cell.viewWithTag(1) as? UIImageView
//        //        imageView?.image = img
//
//        // Section毎に処理を分ける。
//        if indexPath.section == 0 {
//            let img = UIImage(named: (imagesArray?[indexPath.row] as? String ?? ""))
//            // Tag番号 1 で UIImageView インスタンスの生成
//            let imageView = cell.viewWithTag(1) as? UIImageView
//            imageView?.image = img
//
//            // Label インスタンスの生成
//            cell.textLabel?.text = titleValueArray?[indexPath.row] as? String
//            cell.detailTextLabel?.text = subTitleArray?[indexPath.row] as? String
//        } else if indexPath.section == 1 {
//            let img = UIImage(named: imagesArray2?[indexPath.row] as? String ?? "")
//            // Tag番号 1 で UIImageView インスタンスの生成
//            let imageView = cell.viewWithTag(1) as? UIImageView
//            // 表示する画像を設定する.
//            let myImage = UIImage(named: "logo.png")
//            imageView?.image = img
//
//            // Label インスタンスの生成
//            cell.textLabel?.text = titleValueArray?[indexPath.row] as? String
//            cell.detailTextLabel?.text = subTitleArray?[indexPath.row] as? String
//        } else if indexPath.section == 2 {
//            let img = UIImage(named: (imagesArray3?[indexPath.row] as? String ?? ""))
//            // Label インスタンスの生成
//            cell.textLabel?.text = titleValueArray?[indexPath.row] as? String
//            cell.detailTextLabel?.text = subTitleArray?[indexPath.row] as? String
//
//        }
//
//        //tableviewの行のcellにテキストラベルを入れる
//
//        return cell
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //セルを可変にする
//        table.rowHeight = UITableView.automaticDimension
//
//        //NSDictionaryはオブジェクトをキー値と要素を対として保持する配列クラスです。plistの情報を定数dicRootに入れる
//        let dicRoot = NSDictionary.init(contentsOfFile: Bundle.main.path(forResource: "Created", ofType: "plist") ?? "")
//
//        //plistのTitle情報を定数titleArrayFromDicに入れる
//        let titleArrayFromDic: NSArray = NSArray.init(object: dicRoot?.object(forKey: "Title") as Any)
//
//        titleValueArray = (titleArrayFromDic.object(at: 0) as? NSArray)
//
//        let subTitleArrayFormDic: NSArray = NSArray.init(object: dicRoot?.object(forKey: "subTitle") as Any)
//
//        subTitleArray = (subTitleArrayFormDic.object(at: 0) as? NSArray)
//
//        let imagesArrayFormDic: NSArray = NSArray.init(object: dicRoot?.object(forKey: "image") as Any)
//
//        imagesArray = (imagesArrayFormDic.object(at: 0) as? NSArray)
//
//        let imagesArrayFormDic2: NSArray = NSArray.init(object: dicRoot?.object(forKey: "image2") as Any)
//
//        imagesArray2 = (imagesArrayFormDic2.object(at: 0) as? NSArray)
//
//        let imagesArrayFormDic3: NSArray = NSArray.init(object: dicRoot?.object(forKey: "image3") as Any)
//
//        imagesArray3 = (imagesArrayFormDic3.object(at: 0) as? NSArray)
//
//        //        for count in 0..<titleValueArray?.count {
//        //            print(titleValueArray[count])
//        //            print(subTitleArray[count])
//        //            print(imagesArray[count])
//        //        }
//
//    }
//
//    // Cell の高さを125にする
//    func tableView(_ table: UITableView,
//                   heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 125
//    }
//
//}
