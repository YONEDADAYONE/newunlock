//
//  RealmDateBase.swift
//  newunlock
//
//  Created by 米田大弥 on 2019/03/15.
//  Copyright © 2019 hiroya. All rights reserved.
//

import Foundation
import RealmSwift

//var だけではRelme Brower で下記結果がnilになったが@objc dynamicを加えると正常になった
class TrTodo: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var Contents1 = ""
    @objc dynamic var Contents2 = ""
    @objc dynamic var Contents3 = ""
    @objc dynamic var achievementFlg = true
    @objc dynamic var  registrationDate = Date()
    
    //    // idをプライマリキーに設定
    override static func primaryKey() -> String? {
       return "id"
   }
    
}
