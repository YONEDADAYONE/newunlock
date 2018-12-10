//
//  ReviewViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/12/04.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    var info: YameListInfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label1.text = info.Title
        label2.text = info.Second
        label3.text = info.Third
        label4.text = info.Last
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
