//
//  AMExperience.swift
//  About me
//
//  Created by Nathan on 1/31/16.
//  Copyright © 2016 TAC. All rights reserved.
//

import UIKit
import Alamofire

class AMExperience: NSObject {
    
    
    var id = 0
    var type = 0
    var title = String()
    var subtitle = String()
    var descript = String()
    var imageUrl = String()
    var content = String()
    
    init(dic:Dictionary<String,String>) {

        id = (NSNumberFormatter().numberFromString(dic["expId"]!)?.integerValue)!
        type = (NSNumberFormatter().numberFromString(dic["expType"]!)?.integerValue)!
        title = dic["expTitle"]!
        subtitle = dic["expSubtitle"]!
        imageUrl = dic["expImage"]!
        descript = dic["expDescription"]!
        content = dic["expContent"]!
        
    }
    
    


}
