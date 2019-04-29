//
//  FinishTaskViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/03/21.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit
import RealmSwift

class FinishTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myString13 = String()
    var myString14 = String()
    var myString15 = String()
    var myString16 = String()
    
    //    var myStrings:[String] = []
    
    //空の配列
    var todoArray: [StorageBox] = []
    //この配列に
    var todoArray2: [String] = []
    
    
    var bbb = Int()
    var reviewViewController = ReviewViewController()
    
    
    @IBOutlet weak var tableSegumentControl: UISegmentedControl!
    
    
    
    @IBOutlet weak var listTableView2: UITableView!
    
    let realm = try? Realm()
    let storageBox = StorageBox()
    
    var eee = 0
    
    var refreshControl: UIRefreshControl!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //1秒スリープ
//        Thread.sleep(forTimeInterval: 1.0)
        
        _ = try? Realm()
        let filterAchievementFlgFalse = realm?.objects(StorageBox.self).filter("achievementFlg = false").filter("deleteFlg = true")
        //一番最初につくられるのはtrue

        //カウント数を入れる変数
        var i = 0
        
        i = filterAchievementFlgFalse?.count ?? 0
        
        print("happyhappy\(i)")
        
        //ここでrealmデータ更新?
//        var picturList: [String] = [];
//        print("知りたいよ\(picturList.count)")
//        for pictur in picturList {
//            picturList.append(pictur);
//        }
        
//        print("知りたい\(tallPersons?.count)")
//        print("知りたい\((i as AnyObject).count)。")
        print(todoArray.count)
        
//        return (i as AnyObject).count ?? 0
        return i
//        return filterAchievementFlgFalse?.count ?? 00
    }
    
//    //    //スワイプで削除
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        let city = todoArray[indexPath.row]
//        let realm = try? Realm()
//
//
//
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            let city = todoArray[indexPath.row]
//            let realm = try? Realm()
//            try! realm?.write {
//                let city = todoArray[indexPath.row]
//                realm?.delete(city)
//                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//            }
//        }
//
//        return
//
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
//    @available(iOS 11.0, *)
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let favoriteAction = UIContextualAction(style: .destructive,
//                                                title: "go to list",
//                                                handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
//                                                    print("Favorite")
//                                                    // 処理を実行完了した場合はtrue
//
//                                                    let realm = try? Realm()
//                                                    try! realm?.write {
//                                                        let city = self.todoArray[indexPath.row]
//                                                        //                                                       realm?.delete(city)
//                                                        city.achievementFlg = true
//                                                    }
//
//                                                    completion(true)
//        })
//        favoriteAction.backgroundColor = UIColor(red: 210/255.0, green: 82/255.0, blue: 127/255.0, alpha: 1)
//        //        favoriteAction.image = #imageLiteral(resourceName: "学生帽のアイコン素材")
//
//        return UISwipeActionsConfiguration(actions: [favoriteAction])
//    }
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favoriteAction = UIContextualAction(style: .destructive,
                                                title: "achieve",
                                                handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
                                                    print("Favorite")
                                                    // 処理を実行完了した場合はtrue
                                                    
                                                    let realm = try? Realm()
                                                    
                                                    let city = realm?.objects(StorageBox.self).filter("achievementFlg = false").filter("deleteFlg = true")
                                                    
                                                    let name = city?[indexPath.row]
                                                    
                                                    //                                                       realm?.delete(city)
                                                    
//                                                    let selectedRow = self.ListTableView.indexPathForSelectedRow
                                                    //todoArrayに入っている配列にタップされたcell番号を入れ、そのidを取り出してる
                                                    //                                                        city2?[selectedRow?.row ?? 0].achievementFlg = true
                                                    try! realm?.write {
                                                        name?.achievementFlg = true
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
            refresh()
            print("やったー")
            bbb = 0
            ccc()
        case 1:
            refresh()
            print("残念")
            bbb = 1
            ccc()
        default:
            break
        }
    }
    
    func ccc() {
        listTableView2.performBatchUpdates({self.listTableView2.reloadData()})
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell:UITableViewCell! = listTableView2.dequeueReusableCell(withIdentifier: "NameCell")
        
            let city = realm?.objects(StorageBox.self).filter("achievementFlg = false").filter("deleteFlg = true")
            
            let name = city?[indexPath.row]
            //        let name = todoArray[indexPath.row]
            
            
            if bbb == 0 && name?.achievementFlg == false && name?.deleteFlg == true
            {
                cell.textLabel?.text = name?.title
            } else if bbb == 1 && name?.achievementFlg == false && name?.deleteFlg == true {
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
            
            print(results?[0].id ?? 100)
            
            //        cell.textLabel?.lineBreakMode = .byTruncatingTail
        
        return cell
    }
    
    
    // trueを返すことでCellのアクションを許可しています
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
        
        listTableView2.dataSource = self
        listTableView2.delegate = self
        fetchDate()
    }
    
    
    @IBAction func tap(_ sender: UIBarButtonItem) {
        ccc()
    }
    
    func test(){
        
        // DBから試合結果データの一覧取得
        let realm = try! Realm()
        let MatchResultList = realm.objects(StorageBox.self)
        
        // tableDataを初期化する場合
        todoArray.removeAll()
        
//        // tableDataを設定
//        MatchResultList.forEach{
//            let cell = $0.title
//            todoArray2.append(cell)
//        }
        
        DispatchQueue.main.async {
            self.listTableView2.reloadData()
        }
    }
    
    //自作関数
    func fetchDate() {
        guard let realm = try? Realm() else {
            return
        }
        //空の配列todoArrayにrelmeのデータを入れてフィルターをかける
        do {
            todoArray = Array(realm.objects(StorageBox.self).sorted(byKeyPath: "registrationDate",
                                                                    ascending: true).filter("deleteFlg = 1").filter("achievementFlg = 0"))
        }
        
    }
    
    
    override func prepare(for segusegu: UIStoryboardSegue, sender: Any?)
    {
        if let selectedRow = listTableView2.indexPathForSelectedRow {
            let controller = segusegu.destination as! AlbumTableViewController
            print("セレクトは\(selectedRow.row)")
            print("prepare")
            let city = realm?.objects(StorageBox.self).filter("achievementFlg = false").filter("deleteFlg = true")
            controller.aaa = city?[selectedRow.row].id ?? 0
        }
    }
    
    //http://mothulog.hateblo.jp/entry/uitableview-pull-to-refresh
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    private func initializePullToRefresh() {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(onPullToRefresh(_:)), for: .valueChanged)
        listTableView2.addSubview(control)
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
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.completeRefresh()
            }
        }
    }
    
    private func completeRefresh() {
        stopPullToRefresh()
        listTableView2.reloadData()
    }
    
}





//import UIKit
//import RealmSwift
//
//class FinishTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var todoArray: [TrTodo] = []
//    let realm = try? Realm()
//    let storageBox = TrTodo()
//    var bbb = Int()
//    
//    
//    @IBOutlet weak var finishTaskTableView: UITableView!
//    @IBOutlet weak var tableSegumentControl: UISegmentedControl!
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        _ = try? Realm()
//        
//        let tallPersons = realm?.objects(TrTodo.self).filter("achievementFlg = false")
//        
//        print("知りたい\(tallPersons?.count)")
//        
//        print(todoArray.count)
//        
//        return tallPersons?.count ?? 0
//    }
//    
//    //    //スワイプで削除
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        let city = todoArray[indexPath.row]
//        let realm = try? Realm()
//        
//        
//        
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            let city = todoArray[indexPath.row]
//            let realm = try? Realm()
//            try! realm?.write {
//                let city = todoArray[indexPath.row]
//                realm?.delete(city)
//                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//            }
//        }
//        
//        return
//        
//    }
//    
//    func ccc() {
//        finishTaskTableView.performBatchUpdates({self.finishTaskTableView.reloadData()})
//    }
//    
//    @IBAction func SegumentControl(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            print("やったー")
//            bbb = 0
//            ccc()
//        case 1:
//            print("残念")
//            bbb = 1
//            ccc()
//        default:
//            break
//        }
//    }
//    
//    
//    
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell:UITableViewCell! = finishTaskTableView.dequeueReusableCell(withIdentifier: "NameCell")
//        
//        let name = todoArray[indexPath.row]
//        
//        
//        if bbb == 0 && name.achievementFlg == false
//        {
//            cell.textLabel?.text = name.title
//        } else if bbb == 1 && name.achievementFlg == false {
//            cell.textLabel?.text = name.Contents1
//        } else {
//            print("nai")
//        }
//        
//        print("\(cell.textLabel?.text ?? "まい")")
//        print(name)
//        print("インデックスパスは\(indexPath.row)")
//        
//        //http://swift.hiros-dot.net/?p=632 とても参考になった
//        let results = realm?.objects(TrTodo.self)
//        
//        print(results?[0].id ?? 100)
//        
//        //        cell.textLabel?.lineBreakMode = .byTruncatingTail
//        return cell
//    }
//
//    // trueを返すことでCellのアクションを許可しています
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
//    {
//        return true
//    }
//    
//    // Cellのスワイプメソッドを実装します
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        _ = try? Realm()
//        //空の配列のCityArrayにrelmeのデータを入れる
//        todoArray = Array((realm?.objects(TrTodo.self))!)
//        
//        // Do any additional setup after loading the view.
//        finishTaskTableView.dataSource = self
//        finishTaskTableView.delegate = self
//        fetchDate()
//    }
//    
//    //自作関数
//    func fetchDate() {
//        guard let realm = try? Realm() else {
//            return
//        }
//        //空の配列todoArrayにrelmeのデータを入れてフィルターをかける
//        do {
//            todoArray = Array(realm.objects(TrTodo.self).filter("achievementFlg = 1").sorted(byKeyPath: "registrationDate", ascending: false))
//        }
//    }
//
//}
