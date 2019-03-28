//
//  FifthViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/23.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    var myString6 = String()
    var myString7 = String()
    var myString8 = String()
    @IBOutlet weak var FifthTextField: UITextField!
    
    
    var reviewViewController = ReviewViewController()
    
    
    @IBAction func enter4(_ sender: Any)
    {
        performSegue(withIdentifier: "seguekonbu", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func prepare(for seguekonbu: UIStoryboardSegue, sender: Any?) {
        var resultViewController = seguekonbu.destination as! resultViewController
        resultViewController.myString9 = myString6
        resultViewController.myString10 = myString7
        resultViewController.myString11 = myString8
        resultViewController.myString12 = FifthTextField.text!
    }

}
