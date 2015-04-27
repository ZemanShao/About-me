//
//  ExperienceDetailViewController.swift
//  About me
//
//  Created by Nathan on 4/26/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        
    }
    
    //MARK: - UI Configure
    func configureView(){
        self.view.layer.cornerRadius = 8
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.layer.masksToBounds = false
        self.view.layer.shadowColor = UIColor.blackColor().CGColor
        self.view.layer.shadowOffset = CGSizeMake(1, 1)
        self.view.layer.shadowOpacity = 0.5
        self.view.layer.shadowRadius = 1.0
    }
    
    
    //MARK: - Action
    @IBAction func backgroundDidPressed(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
