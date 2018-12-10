//
//  ListViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/24.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

struct YameListInfo {
    var Title:String
    var Second:String
    var Third:String
    var Last:String
}

class ListViewController: UIViewController,UITableViewDataSource{
    
    var myString13 = String()
    var myString14 = String()
    var myString15 = String()
    var myString16 = String()
    
    var myStrings:[String] = []
    
    @IBOutlet weak var ListTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myStrings.count
          return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
        
//        cell.textLabel?.text = myStrings[indexPath.row]
       cell.textLabel?.text = myString13
        
        return cell
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        ListTableView.dataSource = self
        
        myStrings.append(myString13)
        myStrings.append(myString14)
        myStrings.append(myString15)
        myStrings.append(myString16)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
//    @IBAction func B(_ sender: UISegmentedControl) {
//        A()
//    }
//
//    func A() {
//        if SegmentedControl.selectedSegmentIndex == 0 {
//            let cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
//            cell.textLabel?.text = myString13
//
//        } else if SegmentedControl.selectedSegmentIndex == 1 {
//            let cell:UITableViewCell! = ListTableView.dequeueReusableCell(withIdentifier: "NameCell")
//            cell.textLabel?.text = myString16
//
//        }
//    }

    override func prepare(for seguen: UIStoryboardSegue, sender: Any?)
    {
        if let selectedRow = ListTableView.indexPathForSelectedRow {
            var YameItems = [
                YameListInfo(Title: myString13, Second: myString14, Third: myString15, Last: myString16)]
            let controller = seguen.destination as! ReviewViewController
            controller.info = YameItems[selectedRow.row]
    }

    }
    
}
