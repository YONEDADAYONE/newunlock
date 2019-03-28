//
//  ReviewViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/12/04.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import RealmSwift
import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
//    var info: YameListInfo!
    
    var aaa = 0
    let realm = try? Realm()
    var todoArray: [TrTodo] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("知りたいのは\(aaa)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoArray = Array((realm?.objects(TrTodo.self))!)
    
        let results = realm?.objects(TrTodo.self)
    
        Label1.text = results?[aaa].Contents1 ?? "a"
        label2.text = results?[aaa].Contents2 ?? "a"
        label3.text = results?[aaa].Contents3 ?? "a"
        label4.text = results?[aaa].title ?? "100"
        
        print("眠い...\(results?[aaa].id ?? 100)")
        print("眠い...\(results?[aaa].Contents1 ?? "a")")
        print("眠い...\(results?[aaa].Contents2 ?? "a")")
        print("眠い...\(results?[aaa].Contents3 ?? "a")")
        print("眠い...\(results?[aaa].title ?? "100")")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
