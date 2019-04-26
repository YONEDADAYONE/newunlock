//
//  ListViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/24.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myString13 = String()
    var myString14 = String()
    var myString15 = String()
    var myString16 = String()
    var myString17 = String()
    
    //    var myStrings:[String] = []
    
    //空の配列
    var todoArray2: [String] = []
    var todoArray: [StorageBox] = []
    
    var bbb = Int()
    
    var reviewViewController = ReviewViewController()
    
    @IBOutlet weak var tableSegumentControl: UISegmentedControl!
    @IBOutlet weak var ListTableView: UITableView!
    
    let realm = try? Realm()
    let storageBox = StorageBox()
    
    var eee = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        _ = try? Realm()
        
        //一番最初につくられるのはtrue
        let city = realm?.objects(StorageBox.self).filter("achievementFlg = true")
        
        print("知りたいいい\(city?.count)")
        
        print(todoArray.count)
        
        if todoArray.count == city?.count {

            return todoArray.count
        } else {
            return todoArray.count - city!.count
        }

        
        
        return todoArray.count
    }
    
//    //スワイプで削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let city = todoArray[indexPath.row]
        let realm = try? Realm()

        if editingStyle == UITableViewCell.EditingStyle.delete {

            let realm = try? Realm()
            try! realm?.write {
            let city = todoArray[indexPath.row]
            realm?.delete(city)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            }
        }
        return
    }
    
    //https://www.youtube.com/watch?v=wUVfE8cY2Hw
    //http://an.hatenablog.jp/entry/2017/10/23/225424
    //https://dev.classmethod.jp/smartphone/iphone/ios-11-new-swipe-action-methods/
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favoriteAction = UIContextualAction(style: .destructive,
                                                title: "達成",
                                                handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
                                                    print("Favorite")
                                                    // 処理を実行完了した場合はtrue
                                                    
                                                    let realm = try? Realm()
                                                    try! realm?.write {
                                                        let city = self.todoArray[indexPath.row]
//                                                        realm?.delete(city)
                                                        city.achievementFlg = false
                                                    }
                                                    
                                                    completion(true)
        })
        favoriteAction.backgroundColor = UIColor(red: 210/255.0, green: 82/255.0, blue: 127/255.0, alpha: 1)
        favoriteAction.image = #imageLiteral(resourceName: "学生帽のアイコン素材")
        
        return UISwipeActionsConfiguration(actions: [favoriteAction])
    }
    
    @IBAction func SegumentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("やったー")
            bbb = 0
        case 1:
            print("残念")
            bbb = 1
        default:
            break
        }
    }
    
    func ddd() {
        ListTableView.beginUpdates()
        //データを変更する処理など
        ListTableView.endUpdates()
    }
    

    @IBAction func a(_ sender: Any) {
        ListTableView.reloadData()
    }
    
    //https://teratail.com/questions/109742
    func test(){
        
        // DBから試合結果データの一覧取得
        let realm = try! Realm()
        let MatchResultList = realm.objects(StorageBox.self)
        
        // tableDataを初期化する場合
        todoArray.removeAll()
        
//        // tableDataを設定
//        MatchResultList.forEach{
//            let cell = $0.title
//            todoArray.append(cell)
//        }
        
        DispatchQueue.main.async {
            self.ListTableView.reloadData()
        }
    }
    
    
//    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle,
//                   forRowAtIndexPath indexPath: NSIndexPath) {
//
//
//        ListTableView.deleteRows(at: indexPath.ro, with: <#T##UITableView.RowAnimation#>)
//
//        tableView.deleteRowsAtIndexPaths([IndexPath(forRow: indexPath.row, inSection: 0)],
//                                         withRowAnimation: UITableView.RowAnimation.Fade)
//
//
//    }
    
    
    func ccc() {
        ListTableView.performBatchUpdates({self.ListTableView.reloadData()})
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
        
        let name = todoArray[indexPath.row]
        
        
        if bbb == 0 && name.achievementFlg == true
        {
            cell.textLabel?.text = name.title
        } else if bbb == 1 && name.achievementFlg == true {
            cell.textLabel?.text = name.Contents1
        } else {
            print("nai")
        }
        print("\(cell.textLabel?.text ?? "まい")")
        print(name)
        print("インデックスパスは\(indexPath.row)")
//        print(name.Contents1)
//        print(name.Contents2)
//        print(name.Contents3)
        
        //http://swift.hiros-dot.net/?p=632 とても参考になった
        let results = realm?.objects(StorageBox.self)
        
        print(results?[0].id ?? 100)
        
//        cell.textLabel?.lineBreakMode = .byTruncatingTail
        return cell
    }

    
     // trueを返すことでCellのアクションを許可しています
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    

    // Cellのスワイプメソッドを実装します
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let realm = try? Realm() else {
            return
        }
        //空の配列のCityArrayにrelmeのデータを入れる
        todoArray = Array(realm.objects(StorageBox.self))
        
        ListTableView.dataSource = self
        ListTableView.delegate = self
        fetchDate()
    }
    
    //自作関数
    func fetchDate() {
        guard let realm = try? Realm() else {
            return
        }
        //空の配列todoArrayにrelmeのデータを入れてフィルターをかける
        do {
            todoArray = Array(realm.objects(StorageBox.self).filter("achievementFlg = 1").sorted(byKeyPath: "registrationDate", ascending: true))
        }
        
    }
    
    
    override func prepare(for seguen: UIStoryboardSegue, sender: Any?)
    {
        if let selectedRow = ListTableView.indexPathForSelectedRow {
            let controller = seguen.destination as! AlbumTableViewController
            print("セレクトは\(selectedRow.row)")
            print("prepare")
            controller.aaa = selectedRow.row
        }
    }
}
