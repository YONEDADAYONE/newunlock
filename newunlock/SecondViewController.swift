//
//  SecondViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/20.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import TwitterCore
import TwitterKit
import UIKit

class SecondViewController: UIViewController, TWTRComposerViewControllerDelegate {
    
//    @IBOutlet weak var label: UILabel!
    
    var myString = String()
    
    @IBAction func enter2(_ sender: Any)
    {
        performSegue(withIdentifier: "segueko", sender: self)
        
    }
    
    
    @IBAction func button(_ sender: UIButton) {
        func sndTweet() {
            // 1.ログインされているか？
            if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
                // 2.ツィート開始
                sndTweetExec()
            } else {
                // 3.認証開始
                TWTRTwitter.sharedInstance().logIn(with: self, completion: { (session, error) in
                    if let sess = session {
                        print("Signed in as \(sess.userName)")
                        // 4.ツィート開始
                        self.sndTweetExec()
                    } else {
                        // 5.認証失敗
                        print("login error: \(error?.localizedDescription)")
                    }
                })
            }
        }

        
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
