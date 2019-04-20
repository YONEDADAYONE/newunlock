//
//  ThirdViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/20.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var ThirdLabel: UILabel!
    var myString3 = String()
    @IBOutlet weak var secondTextField: UITextField!
    
    
    @IBAction func enter3(_ sender: Any)
    {
        performSegue(withIdentifier: "segueTaro", sender: self)
    }
    
    override func prepare(for segueTaro: UIStoryboardSegue, sender: Any?)
    {
        
        var fourthViewController = segueTaro.destination as! fourthViewController
        fourthViewController.myString4 = myString3
        fourthViewController.myString5 = secondTextField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
