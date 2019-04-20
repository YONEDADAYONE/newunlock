//
//  FreeMemoViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/17.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit

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
        
    }
    
    override func prepare(for seguekonbu: UIStoryboardSegue, sender: Any?) {
        let setViewController = seguekonbu.destination as! SetViewController
        setViewController.myString13 = myString9
        setViewController.myString14 = myString10
        setViewController.myString15 = myString11
        setViewController.myString16 = myString12
        setViewController.myString17 = memoTextView.text!
    }
    
}
