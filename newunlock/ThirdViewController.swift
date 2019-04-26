//
//  ThirdViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/20.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit
import RealmSwift

class ThirdViewController: UIViewController,UITabBarDelegate {

    @IBOutlet weak var ThirdLabel: UILabel!
    var myString3 = String()
    @IBOutlet weak var secondTextField: UITextField!
    
    
    @IBAction func enter3(_ sender: Any)
    {
        performSegue(withIdentifier: "segueTaro", sender: self)
        print(Realm.Configuration.defaultConfiguration.fileURL ?? "")
    }
    
    // 改行でキーボードを隠す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func prepare(for segueTaro: UIStoryboardSegue, sender: Any?)
    {
        
        var fourthViewController = segueTaro.destination as! fourthViewController
        fourthViewController.myString4 = myString3
        fourthViewController.myString5 = secondTextField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
