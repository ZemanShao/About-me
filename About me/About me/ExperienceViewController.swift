//
//  ExperienceViewController.swift
//  About me
//
//  Created by Nathan on 4/25/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit


class ExperienceViewController: UIViewController {

    @IBOutlet weak var nameLabelView: FBShimmeringView!
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNameLabel()
        self.configureGestureRecognizer()
    }
    

    // MARK: - UI Configure
    func configureNameLabel(){
        
        self.nameLabelView.shimmering = true
        self.nameLabelView.shimmeringBeginFadeDuration = 1
        self.nameLabelView.shimmeringOpacity = 1.0
        self.nameLabelView.shimmeringSpeed = 80
        self.nameLabelView.shimmeringPauseDuration = 1.5
        
        var nameLabel = UILabel()
        nameLabel.text = "Zeman Shao"
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        nameLabel.sizeToFit()
        nameLabel.frame.origin = CGPointMake(0, 0)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.backgroundColor = UIColor.clearColor()
        nameLabel.layer.masksToBounds = false
        nameLabel.layer.shadowColor = UIColor.blackColor().CGColor
        nameLabel.layer.shadowOffset = CGSizeMake(1, 1)
        nameLabel.layer.shadowOpacity = 0.5
        nameLabel.layer.shadowRadius = 1.0
        
        self.nameLabelView.contentView = nameLabel
        
    }
    
    func configureGestureRecognizer(){
        let recognizer = UITapGestureRecognizer(target: self, action: "headerImageViewDidPressed")
        self.headerImageView.addGestureRecognizer(recognizer)
    }
    
    @IBAction func headerImageViewDidPressed(){
        println("Tap!!!")

    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
}
