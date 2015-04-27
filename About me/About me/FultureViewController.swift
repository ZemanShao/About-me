//
//  FultureViewController.swift
//  About me
//
//  Created by Nathan on 4/27/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class FultureViewController: ExperienceDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text1 = UILabel()

        text1.text = "WWDC15"
        text1.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        text1.sizeToFit()
        text1.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2, (UIScreen.mainScreen().bounds.height-200)/2.2)
        self.view.addSubview(text1)

        let text2 = UILabel()

        text2.text = "I Will Be There"
        text2.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        text2.textColor = UIColor.grayColor()
        text2.sizeToFit()
        text2.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2, (UIScreen.mainScreen().bounds.height-200)/1.8)
        self.view.addSubview(text2)

    }
    
}
