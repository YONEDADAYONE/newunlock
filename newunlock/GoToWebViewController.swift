//
//  GoToWebViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/04/07.
//  Copyright © 2019 hiroya. All rights reserved.
//

import UIKit
import WebKit

class GoToWebViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self
        if let url: URL = URL(string: "https://twitter.com/search?q=%23Heartunlock&src=typd") {
            
            //https://dev.classmethod.jp/smartphone/launching-app-store-from-ios-app/
            // URLを開けるかをチェックする
            if UIApplication.shared.canOpenURL(url) {
                // URLを開く
                UIApplication.shared.open(url, options: [:]) { success in
                    if success {
                        print("Launching \(url) was successful")
                    }
                }
            }
            
            
            let request: URLRequest = URLRequest(url: url)
            // インスタンスをビューに追加する
            webView.load(request)
        }
    }

}
