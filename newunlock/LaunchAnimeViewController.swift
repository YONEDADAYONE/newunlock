//
//  LaunchAnimeViewController.swift
//  newunlock
//
//  Created by 米田大弥 on 2018/12/06.
//  Copyright © 2018年 hiroya. All rights reserved.
//

import UIKit

class LaunchAnimeViewController: UIViewController {

    var timer = Timer()
    
    var imageArray = [UIImage]()
    
    @IBOutlet weak var LaunchAnimeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        
        imageArray = [image0!,image1!,image2!]

        //タイマーは基本この形
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (timer) in
            
            self.LaunchAnimeImageView.image = UIImage(named: "dash0.png")
            
        })
        
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
            
            self.LaunchAnimeImageView.image = UIImage(named: "dash1.png")
            
        })
        
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { (timer) in
            
            self.LaunchAnimeImageView.image = UIImage(named: "dash2.png")
            
        })
        
        timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false, block: { (timer) in
            
            self.performSegue(withIdentifier: "segue", sender: self)
            
        })
    }

}
