//
//  AlbumTableViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/21.
//  Copyright © 2019 hiroya. All rights reserved.
//

import TwitterCore
import TwitterKit
import RealmSwift
import UIKit

class AlbumTableViewController: UITableViewController,TWTRComposerViewControllerDelegate {

    
    @IBOutlet weak var listCell: UITableViewCell!
    @IBOutlet weak var listCell2: UITableViewCell!
    @IBOutlet weak var listCell3: UITableViewCell!
    @IBOutlet weak var listCell4: UITableViewCell!
    @IBOutlet weak var listCell5: UITableViewCell!
    
    var listString = String()
    var listString2 = String()
    var listString3 = String()
    var listString4 = String()
    var listString5 = String()
    
    var aaa = 0
    let realm = try? Realm()
    var todoArray: [StorageBox] = []
    //空の変数の入れ物を用意
    var imgTweet: UIImageView?
    var tvTweet: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoArray = Array((realm?.objects(StorageBox.self))!)
        
        let results = realm?.objects(StorageBox.self)
        
        listCell.textLabel?.text = results?[aaa].title ?? "a"
        listCell2.textLabel?.text = results?[aaa].Contents1
        listCell3.textLabel?.text = results?[aaa].Contents2 ?? "a"
        listCell4.textLabel?.text = results?[aaa].Contents3 ?? "a"
        listCell5.textLabel?.text = results?[aaa].Contents4 ?? "a"
        
        print("眠い...\(results?[aaa].id ?? 100)")
        print("眠い...\(results?[aaa].Contents1 ?? "a")")
        print("眠い...\(results?[aaa].Contents2 ?? "a")")
        print("眠い...\(results?[aaa].Contents3 ?? "a")")
        print("眠い...\(results?[aaa].title ?? "100")")
        
    }
    
    @IBAction func goToTwitter(_ sender: UIBarButtonItem) {
        if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
            
            // キャプチャしたい枠を決める
            let rect = view.bounds
            
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
            
            // ここでtrueを指定しないと、画面が変わった時に再キャプチャできないらしい
            view.drawHierarchy(in: rect, afterScreenUpdates: true)
            
            let cont = UIGraphicsGetCurrentContext()
            view.layer.render(in: cont!)
            
            // キャプチャした画像を変数に保持
            let image = UIGraphicsGetImageFromCurrentImageContext()!
            
            UIGraphicsEndImageContext()
            
            let shareImg2: UIImage = image
            
            //            let overView = Overview.init(initialText: "メガネを探す女性です。", image: shareImg2, videoURL: nil)
            
            let composer = TWTRComposerViewController(initialText: "#unlock", image: shareImg2, videoURL: nil)
            
            composer.delegate = self
            present(composer, animated: true, completion: nil)
            
            //        } else {
            //                    let alert = UIAlertController(title: "Twitterアカウントがありません。",
            //                                                  message: "アカウントを作成してください。",
            //                                                  preferredStyle: .alert)
            //                    self.present(alert, animated: false, completion: nil)
            //                }
        } else {
            //                let alert = UIAlertController(title: "Twitterアカウントもしくはアプリがありません。",
            //                                              message: "アカウントを作成してください。",
            //                                            preferredStyle: .alert)
            //                self.present(alert, animated: false, completion: nil)
            
            let alert: UIAlertController =
                UIAlertController(title: "デバイス内にTwitterアプリがありません",
                                  message: "処理を選んで下さい",
                                  preferredStyle: UIAlertController.Style.actionSheet)
            
            let facebookActionsheet: UIAlertAction =
                UIAlertAction(title: "OK",
                              style: UIAlertAction.Style.default,
                              handler: {(_: UIAlertAction) in
                                //                                print("Facebook")
                })
            
            //            let twitterActionsheet: UIAlertAction =
            //                UIAlertAction(title: "Twitter",
            //                              style: UIAlertAction.Style.default,
            //                              handler: {(_: UIAlertAction) in
            //                                print("Twitter")
            //                })
            //
            let lineActionsheet: UIAlertAction =
                UIAlertAction(title: "NG",
                              style: UIAlertAction.Style.default,
                              handler: {(_: UIAlertAction) in
                                print("LINE")
                })
            
            alert.addAction(facebookActionsheet)
            //            alert.addAction(twitterActionsheet)
            alert.addAction(lineActionsheet)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        return
    }
    
    func composerDidCancel(_ controller: TWTRComposerViewController) {
        print("composerDidCancel, composer cancelled tweet")
    }
    
    func composerDidSucceed(_ controller: TWTRComposerViewController, with tweet: TWTRTweet) {
        print("composerDidSucceed tweet published")
    }
    func composerDidFail(_ controller: TWTRComposerViewController, withError error: Error) {
        print("composerDidFail, tweet publish failed == \(error.localizedDescription)")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // それぞれのセクション毎に何行のセルがあるかを返します
        switch section {
        case 0: // 「設定」のセクション に返すcellの数
            return 1
        case 1: // 「その他」のセクション に返すcellの数。今回の場合アプリバージョンとライセンスの二つをか返したいから2になる。
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        default: // ここが実行されることはないはず
            return 0
        }
        
    }

}


//import TwitterCore
//import TwitterKit
//import RealmSwift
//import UIKit
//
//class ReviewViewController: UIViewController, TWTRComposerViewControllerDelegate  {
//
//    @IBOutlet weak var Label1: UILabel!
//    @IBOutlet weak var label2: UILabel!
//    @IBOutlet weak var label3: UILabel!
//    @IBOutlet weak var label4: UILabel!
//    @IBOutlet weak var textView: UITextView!
//    //    var info: YameListInfo!
//
//    var aaa = 0
//    let realm = try? Realm()
//    var todoArray: [StorageBox] = []
//    //空の変数の入れ物を用意
//    var imgTweet: UIImageView?
//    var tvTweet: UITextView?
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("知りたいのは\(aaa)")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        todoArray = Array((realm?.objects(StorageBox.self))!)
//
//        let results = realm?.objects(StorageBox.self)
//
//        Label1.text = results?[aaa].Contents1 ?? "a"
//        label2.text = results?[aaa].Contents2 ?? "a"
//        label3.text = results?[aaa].Contents3 ?? "a"
//        label4.text = results?[aaa].title ?? "100"
//
//        textView.text = results?[aaa].Contents1 ?? "a"
//        textView.isEditable = false
//
//        print("眠い...\(results?[aaa].id ?? 100)")
//        print("眠い...\(results?[aaa].Contents1 ?? "a")")
//        print("眠い...\(results?[aaa].Contents2 ?? "a")")
//        print("眠い...\(results?[aaa].Contents3 ?? "a")")
//        print("眠い...\(results?[aaa].title ?? "100")")
//
//    }
//
//    @IBAction func textButton(_ sender: UIButton) {
//        textView.isEditable = true
//    }
//
//    @IBAction func goToTwitter(_ sender: UIButton) {
//        //        TWTRComposer().show(from: self) { _ in }
//        if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
//
//            // キャプチャしたい枠を決める
//            let rect = view.bounds
//
//            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
//
//            // ここでtrueを指定しないと、画面が変わった時に再キャプチャできないらしい
//            view.drawHierarchy(in: rect, afterScreenUpdates: true)
//
//            let cont = UIGraphicsGetCurrentContext()
//            view.layer.render(in: cont!)
//
//            // キャプチャした画像を変数に保持
//            let image = UIGraphicsGetImageFromCurrentImageContext()!
//
//            UIGraphicsEndImageContext()
//
//            let shareImg2: UIImage = image
//
//            //            let overView = Overview.init(initialText: "メガネを探す女性です。", image: shareImg2, videoURL: nil)
//
//            let composer = TWTRComposerViewController(initialText: "#unlock", image: shareImg2, videoURL: nil)
//
//            composer.delegate = self
//            present(composer, animated: true, completion: nil)
//
//            //        } else {
//            //                    let alert = UIAlertController(title: "Twitterアカウントがありません。",
//            //                                                  message: "アカウントを作成してください。",
//            //                                                  preferredStyle: .alert)
//            //                    self.present(alert, animated: false, completion: nil)
//            //                }
//        } else {
//            //                let alert = UIAlertController(title: "Twitterアカウントもしくはアプリがありません。",
//            //                                              message: "アカウントを作成してください。",
//            //                                            preferredStyle: .alert)
//            //                self.present(alert, animated: false, completion: nil)
//
//            let alert: UIAlertController =
//                UIAlertController(title: "デバイス内にTwitterアプリがありません",
//                                  message: "処理を選んで下さい",
//                                  preferredStyle: UIAlertController.Style.actionSheet)
//
//            let facebookActionsheet: UIAlertAction =
//                UIAlertAction(title: "OK",
//                              style: UIAlertAction.Style.default,
//                              handler: {(_: UIAlertAction) in
//                                //                                print("Facebook")
//                })
//
//            //            let twitterActionsheet: UIAlertAction =
//            //                UIAlertAction(title: "Twitter",
//            //                              style: UIAlertAction.Style.default,
//            //                              handler: {(_: UIAlertAction) in
//            //                                print("Twitter")
//            //                })
//            //
//            let lineActionsheet: UIAlertAction =
//                UIAlertAction(title: "NG",
//                              style: UIAlertAction.Style.default,
//                              handler: {(_: UIAlertAction) in
//                                print("LINE")
//                })
//
//            alert.addAction(facebookActionsheet)
//            //            alert.addAction(twitterActionsheet)
//            alert.addAction(lineActionsheet)
//
//            self.present(alert, animated: true, completion: nil)
//
//        }
//        return
//    }
//
//    func composerDidCancel(_ controller: TWTRComposerViewController) {
//        print("composerDidCancel, composer cancelled tweet")
//    }
//
//    func composerDidSucceed(_ controller: TWTRComposerViewController, with tweet: TWTRTweet) {
//        print("composerDidSucceed tweet published")
//    }
//    func composerDidFail(_ controller: TWTRComposerViewController, withError error: Error) {
//        print("composerDidFail, tweet publish failed == \(error.localizedDescription)")
//    }
//
//    //    func sndTweetExec() {
//    //        let str:String = "サンプルツィート"
//    //
//    //        // 1.コントローラー初期化
//    //        let comp = TWTRComposerViewController.init(initialText: str, image: nil, videoData: nil)
//    //
//    //        // 2.デレゲート
//    //        comp.delegate = self
//    //
//    //        // 3.コントローラ表示
//    //        present(comp, animated: true, completion: nil)
//    //    }
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//
//}
