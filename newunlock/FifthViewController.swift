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
    
    @IBAction func enter4(_ sender: Any)
    {
        performSegue(withIdentifier: "seguekonbu", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for seguekonbu: UIStoryboardSegue, sender: Any?) {
        var resultViewController = seguekonbu.destination as! resultViewController
        resultViewController.myString9 = myString6
        resultViewController.myString10 = myString7
        resultViewController.myString11 = myString8
        resultViewController.myString12 = FifthTextField.text!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
