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
//        TWTRComposer().show(from: self) { _ in }
        
        let shareImage = (UIImage)();getScreenShot().pngData()
        
        let str:String = "サンプルツィート"
        
        // 1.コントローラー初期化
        let comp = TWTRComposerViewController.init(initialText: str, image: shareImage, videoData: nil)
        
        // 2.デレゲート
        comp.delegate = self
        
        // 3.コントローラ表示
        present(comp, animated: true, completion: nil)
    }
    
    func getScreenShot()-> UIImage {
        // キャプチャ範囲を決定
        let width = Int(UIScreen.main.bounds.size.width)  //画面横幅いっぱい
        let height = 100
        let size = CGSize(width: width, height: height)
        // ビットマップ画像のcontextを作成
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        // 対象のview内の描画をcontextに複写する.
        self.view.layer.render(in: context)
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // contextを閉じる.
        UIGraphicsEndImageContext()
        return capturedImage
    }
//    func sndTweetExec() {
//        let str:String = "サンプルツィート"
//
//        // 1.コントローラー初期化
//        let comp = TWTRComposerViewController.init(initialText: str, image: nil, videoData: nil)
//
//        // 2.デレゲート
//        comp.delegate = self
//
//        // 3.コントローラ表示
//        present(comp, animated: true, completion: nil)
//    }
//
    
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
