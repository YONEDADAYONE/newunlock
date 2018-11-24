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

    ThirdLabel.text = myString3

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
