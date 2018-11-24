//
//  SecondViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/20.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
//    @IBOutlet weak var label: UILabel!
    
    var myString = String()
    
    @IBAction func enter2(_ sender: Any)
    {
        performSegue(withIdentifier: "segueko", sender: self)
        
    }
    
    
    override func prepare(for segueko: UIStoryboardSegue, sender: Any?)
    {
        var ThirdViewController = segueko.destination as! ThirdViewController
        ThirdViewController.myString3 = myString
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        label.text = myString
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
