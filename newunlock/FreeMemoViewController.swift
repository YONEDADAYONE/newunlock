//
//  FreeMemoViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/17.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class FreeMemoViewController: UIViewController {
    
    var myString9 = String()
    var myString10 = String()
    var myString11 = String()
    var myString12 = String()
    
    @IBOutlet weak var memoTextView: UITextView!
    
    
    @IBAction func enter5(_ sender: UIButton) {
                performSegue(withIdentifier: "segueri", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TextViewを角丸にするプロパティ
        memoTextView.layer.cornerRadius = 15
    }
    
    override func prepare(for segueri: UIStoryboardSegue, sender: Any?) {
        let resultTableViewController = segueri.destination as! ResultTableViewController
        resultTableViewController.registrationString = myString9
        resultTableViewController.registrationString2 = myString10
        resultTableViewController.registrationString3 = myString11
        resultTableViewController.registrationString4 = myString12
        resultTableViewController.registrationString5 = memoTextView.text!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
