//
//  ViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/11/20.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var button: UIButton!
    
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
    @IBAction func enter(_ sender: Any)
    {
        if textField.text != ""
        {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var SecondController = segue.destination as! SecondViewController
        SecondController.myString = textField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        textField.delegate = self
        
        // 画面サイズ取得
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // 表示窓のサイズと位置を設定
        scrollView.frame.size =
            CGSize(width: screenWidth, height: screenHeight)
        
        // UIScrollViewに追加
        scrollView.addSubview(textField)
        scrollView.addSubview(button)
        
        // UIScrollViewの大きさをスクリーンの縦方向を２倍にする
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*2)
        // スクロールの跳ね返り無し
        scrollView.bounces = false
        // ビューに追加
        self.view.addSubview(scrollView)
    }
    
    // 改行でキーボードを隠す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,selector: #selector(self.keyboardWillShow(notification:)),name:UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(self.keyboardWillHide(notification:)),name:UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,name:UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name:UIResponder.keyboardWillHideNotification,object: nil)
    }

}

extension ViewController{
    //キーボードが表示された時に呼ばれる
    @objc func keyboardWillShow(notification: NSNotification) {
        //キーボードが押された時に伸ばすコンテンツのサイズ
        let insertHeight:CGFloat = 250
        //スクロールビューのなかのコンテンツのサイズを指定
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight + insertHeight)
        let offset = CGPoint(x: 0, y: insertHeight)
        //offsetで指定した分スクロールする
        scrollView.setContentOffset(offset, animated: true)
    }
    //キーボードが閉じる時に呼ばれる
    @objc func keyboardWillHide(notification: NSNotification) {
        //スクロールビューのなかのコンテンツのサイズを元の大きさへ戻す
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight)
    }
}
