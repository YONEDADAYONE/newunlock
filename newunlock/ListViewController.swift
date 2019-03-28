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
    
    //    var myStrings:[String] = []
    
    //空の配列
    var todoArray: [TrTodo] = []
    
    var bbb = Int()
    
    var reviewViewController = ReviewViewController()
    
    @IBOutlet weak var tableSegumentControl: UISegmentedControl!
    
    @IBOutlet weak var ListTableView: UITableView!
    
    let realm = try? Realm()
    let storageBox = TrTodo()
    
    var eee = 0
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return myStrings.count
        
        _ = try? Realm()
        //空の配列のCityArrayにrelmeのデータを入れる
        todoArray = Array((realm?.objects(TrTodo.self))!)
        
        return todoArray.count
    }
    
    
    @IBAction func SegumentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("やったー")
            bbb = 0
            ccc()
        case 1:
            print("残念")
            bbb = 1
            ccc()
        default:
            break
        }
    }
    
    func ccc() {
        ListTableView.performBatchUpdates({self.ListTableView.reloadData()})
        
//            viewDidLoad()
//            super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
        
        //       cell.textLabel?.text = myStrings[indexPath.row]
        //       cell.textLabel?.text = myString13
        
        let name = todoArray[indexPath.row]
        
        if bbb == 0 {
            cell.textLabel?.text = name.title
        } else {
            cell.textLabel?.text = name.Contents1
        }
        
//        cell.textLabel?.text = (name.title)
        
       print("\(cell.textLabel?.text ?? "まい")")
        print(name)
        print("インデックスパスは\(indexPath.row)")
//        print(name.Contents1)
//        print(name.Contents2)
//        print(name.Contents3)
        
        //http://swift.hiros-dot.net/?p=632 とても参考になった
        let results = realm?.objects(TrTodo.self)
        
        print(results?[0].id ?? 100)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//
//        bbb = indexPath.row
//
//        //セルの選択解除
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        reviewViewController.aaa = bbb
//
//        //        controller.aaa = bbb
//
//        //ここに遷移処理を書く
//        self.present(ReviewViewController(), animated: true, completion: nil)
//        print("didselect")
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListTableView.dataSource = self
        ListTableView.delegate = self
        //        myStrings.append(myString13)
        //        myStrings.append(myString14)
        //        myStrings.append(myString15)
        //        myStrings.append(myString16)
        
        
       
    }
    
    override func prepare(for seguen: UIStoryboardSegue, sender: Any?)
    {
        if let selectedRow = ListTableView.indexPathForSelectedRow {
            let controller = seguen.destination as! ReviewViewController
//            controller.info = YameItems[selectedRow.row]
            print("セレクトは\(selectedRow.row)")
            print("prepare")
            controller.aaa = selectedRow.row
        }

    }
    
}

//import UIKit
//import RealmSwift
//
//struct YameListInfo {
//    var Title:String
//    var Second:String
//    var Third:String
//    var Last:String
//}
//
//class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var myString13 = String()
//    var myString14 = String()
//    var myString15 = String()
//    var myString16 = String()
//
////    var myStrings:[String] = []
//
//    //空の配列
//    var todoArray: [TrTodo] = []
//
//    @IBOutlet weak var ListTableView: UITableView!
//
//    let realm = try? Realm()
//    let storageBox = TrTodo()
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return myStrings.count
//          return todoArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
//
////        cell.textLabel?.text = myStrings[indexPath.row]
////       cell.textLabel?.text = myString13
//
//        let name = todoArray[indexPath.row]
//
//        cell.textLabel?.text = (name.title)
//
//        print(cell.textLabel?.text)
//
//        return cell
//    }
//
//        override func viewDidLoad() {
//        super.viewDidLoad()
//
//        ListTableView.dataSource = self
//
////        myStrings.append(myString13)
////        myStrings.append(myString14)
////        myStrings.append(myString15)
////        myStrings.append(myString16)
//    }
//
////    @IBAction func B(_ sender: UISegmentedControl) {
////        A()
////    }
////
////    func A() {
////        if SegmentedControl.selectedSegmentIndex == 0 {
////            let cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
////            cell.textLabel?.text = myString13
////
////        } else if SegmentedControl.selectedSegmentIndex == 1 {
////            let cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
////            cell.textLabel?.text = myString16
////
////        }
////    }
//
//    override func prepare(for seguen: UIStoryboardSegue, sender: Any?)
//    {
//        if let selectedRow = ListTableView.indexPathForSelectedRow {
//            var YameItems = [
//                YameListInfo(Title: myString13, Second: myString14, Third: myString15, Last: myString16)]
//            let controller = seguen.destination as! ReviewViewController
//            controller.info = YameItems[selectedRow.row]
//    }
//
//    }
//
//}
