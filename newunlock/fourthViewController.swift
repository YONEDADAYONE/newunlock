//
//  fourthViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/23.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController {

    var myString4 = String()
    var myString5 = String()
    @IBOutlet weak var fourthTextField: UITextField!

    @IBAction func enter4(_ sender: Any)
    {
        performSegue(withIdentifier: "segueiko", sender: self)
    }
    
    override func prepare(for segueiko: UIStoryboardSegue, sender: Any?)
    {
        
        var FifthViewController = segueiko.destination as! FifthViewController
        FifthViewController.myString6 = myString4
        FifthViewController.myString7 = myString5
        FifthViewController.myString8 = fourthTextField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
