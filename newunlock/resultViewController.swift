//
//  resultViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/23.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    var myString9 = String()
    var myString10 = String()
    var myString11 = String()
    var myString12 = String()
    
    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    @IBOutlet weak var resultLabel3: UILabel!
    @IBOutlet weak var resultLabel4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultLabel1.text = myString9
        resultLabel2.text = myString10
        resultLabel3.text = myString11
        resultLabel4.text = myString12
    }
    
    @IBAction func enter5(_ sender: Any)
    {
        performSegue(withIdentifier: "seguemon", sender: self)
    }
    
    override func prepare(for seguemon: UIStoryboardSegue, sender: Any?)
    {
        let ListViewController = seguemon.destination as! ListViewController
        ListViewController.myString13 = myString9
        ListViewController.myString14 = myString10
        ListViewController.myString15 = myString11
        ListViewController.myString16 = myString12
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
