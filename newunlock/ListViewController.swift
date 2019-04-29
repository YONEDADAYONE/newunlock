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
    var refreshControl: UIRefreshControl!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        DispatchQueue.main.async {
//            self.ListTableView.reloadData()
//        }
        
        _ = try? Realm()
        
        //一番最初につくられるのはtrue
        let city = realm?.objects(StorageBox.self).filter("achievementFlg = true").filter("deleteFlg = true")
        
        
//        print("知りたいいい\(city?.count)")
        
        print(todoArray.count)
        
//        if todoArray.count == city?.count {
//
//            return todoArray.count
//        } else {
//            return todoArray.count - city!.count
//        }

        var i = 0
        
        i = city?.count ?? 0
        
        print("happyhappy\(i)")
        
        return i
    }
    
////    //スワイプで削除
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        let city = todoArray[indexPath.row]
//        let realm = try? Realm()
//
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//
//            let realm = try? Realm()
//            try! realm?.write {
//            let city = todoArray[indexPath.row]
//            realm?.delete(city)
//            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//            }
//        }
//        return
//    }
    
    // iOS11以降
    // 右から左へスワイプ
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Delete",
                                              handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
                                                print("Delete")
                                                // 処理を実行できなかった場合はfalse
                                                completion(true)

                                                //デリートフラグ
                                                let realm = try? Realm()
                                                try! realm?.write {
                                                    let city = self.todoArray[indexPath.row]
                                                    city.deleteFlg = false
                                                }
        })
        deleteAction.backgroundColor = UIColor(red: 214/255.0, green: 69/255.0, blue: 65/255.0, alpha: 1)

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    //https://www.youtube.com/watch?v=wUVfE8cY2Hw
    //http://an.hatenablog.jp/entry/2017/10/23/225424
    //https://dev.classmethod.jp/smartphone/iphone/ios-11-new-swipe-action-methods/
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favoriteAction = UIContextualAction(style: .destructive,
                                                title: "achieve",
                                                handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
                                                    print("Favorite")
                                                    // 処理を実行完了した場合はtrue
                                                    
                                                    let realm = try? Realm()
                                                    
                                                    let city = realm?.objects(StorageBox.self).filter("achievementFlg = true").filter("deleteFlg = true")
                                                    
                                                    let name = city?[indexPath.row]
                                                    
                                                        //                                                       realm?.delete(city)
                                                        
                                                        let selectedRow = self.ListTableView.indexPathForSelectedRow
                                                            //todoArrayに入っている配列にタップされたcell番号を入れ、そのidを取り出してる
//                                                        city2?[selectedRow?.row ?? 0].achievementFlg = true
                                                    try! realm?.write {
                                                        name?.achievementFlg = false
//                                                        print("まいまい\(city2?[0].achievementFlg)")
//                                                        print("まいまい\(city2?[0].achievementFlg ?? true)")
                                                    }
                                                    
                                                    completion(true)
        })
        favoriteAction.backgroundColor = UIColor(red: 210/255.0, green: 82/255.0, blue: 127/255.0, alpha: 1)
        //        favoriteAction.image = #imageLiteral(resourceName: "学生帽のアイコン素材")
        
        return UISwipeActionsConfiguration(actions: [favoriteAction])
    }
    
    @IBAction func SegumentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("やったー")
            bbb = 0
            refresh()
        case 1:
            print("残念")
            bbb = 1
            refresh()
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

        //todo

        
        let city = realm?.objects(StorageBox.self).filter("achievementFlg = true").filter("deleteFlg = true")
        
        let name = city?[indexPath.row]
        
        print(name)
//        print(todoArray[indexPath.row])
        
        if bbb == 0 && name?.achievementFlg == true && name?.deleteFlg == true
        {
            cell.textLabel?.text = name?.title
        } else if bbb == 1 && name?.achievementFlg == true && name?.deleteFlg == true{
            cell.textLabel?.text = name?.Contents1
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
        
        print("ああああああ\(results?[0].id ?? 100)")
        
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
        
        initializePullToRefresh()
        
        guard let realm = try? Realm() else {
            return
        }
        //空の配列のCityArrayにrelmeのデータを入れる
        todoArray = Array(realm.objects(StorageBox.self))
        
        ListTableView.dataSource = self
        ListTableView.delegate = self
        fetchDate()
    }
    //http://mothulog.hateblo.jp/entry/uitableview-pull-to-refresh
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    // MARK: - Pull to Refresh
    private func initializePullToRefresh() {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(onPullToRefresh(_:)), for: .valueChanged)
        ListTableView.addSubview(control)
        refreshControl = control
    }
    
    @objc private func onPullToRefresh(_ sender: AnyObject) {
        refresh()
    }
    
    private func stopPullToRefresh() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Data Flow
    private func refresh() {
        DispatchQueue.global().async {
//            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.completeRefresh()
            }
        }
    }
    
    private func completeRefresh() {
        stopPullToRefresh()
        ListTableView.reloadData()
    }
    
    //自作関数
    func fetchDate() {
        
        DispatchQueue.main.async {
            self.ListTableView.reloadData()
        }
        
        guard let realm = try? Realm() else {
            return
        }
        //空の配列todoArrayにrelmeのデータを入れてフィルターをかける
        do {
            todoArray = Array(realm.objects(StorageBox.self).sorted(byKeyPath: "registrationDate", ascending: true).filter("deleteFlg = 1").filter("achievementFlg = 1"))
        }
        
    }
    
    
    override func prepare(for seguen: UIStoryboardSegue, sender: Any?)
    {
        if let selectedRow = ListTableView.indexPathForSelectedRow {
            let controller = seguen.destination as! AlbumTableViewController
//            print("セレクトは\(selectedRow.row)")
//            print("ストレージボックスは\(storageBox.id)")
            print(todoArray.description)
            print("アイウエオ\(todoArray[0].id)")
            

            print(todoArray.last)
    
            
            //todoArrayに入っている配列にタップされたcell番号を入れ、そのidを取り出してる
//            controller.aaa = todoArray[selectedRow.row].id
            
            let city = realm?.objects(StorageBox.self).filter("achievementFlg = true").filter("deleteFlg = true")
            controller.aaa = city?[selectedRow.row].id ?? 0
        }
    }
    
//    override func prepare(for seguen: UIStoryboardSegue, sender: Any?)
//    {
//        if let selectedRow = ListTableView.indexPathForSelectedRow {
//            let controller = seguen.destination as! AlbumTableViewController
//            print("セレクトは\(selectedRow.row)")
//            print("ストレージボックスは\(storageBox.id)")
//            print("prepare")
//            controller.aaa = selectedRow.row
////            controller.aaa = storageBox.id
//        }
//    }
}
