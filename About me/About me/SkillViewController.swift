//
//  SkillViewController.swift
//  About me
//
//  Created by Nathan on 1/8/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit


class SkillViewController: ExperienceDetailViewController {

    var circleViewArray = NSMutableArray()

    
    
    //MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureAvatar()
        self.configureLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.configureCircleView()
        
        for view in self.circleViewArray{
            let circleView = view as! SkillCycleView
            circleView.move(0, animated: false)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for view in self.circleViewArray{
            let circleView = view as! SkillCycleView
            circleView.move(circleView.toEnd, animated: true)
        }
    }
    
    //MARK: - UI Configure
    
    func configureAvatar(){
        let avatarView = UIImageView(image: UIImage(named: "Skill_Avatar"))
        avatarView.frame = CGRectMake(0, 0, 80, 80)
        if CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(320, 480)){
            avatarView.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2, (UIScreen.mainScreen().bounds.height-200)/2.5)
        }
        else{
            avatarView.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2, (UIScreen.mainScreen().bounds.height-200)/3)
        }

        self.view.addSubview(avatarView)
    }
    
    func configureLabel(){
        let bluePoint = UIView(frame: CGRectMake(0, 0, 15, 15))
        bluePoint.backgroundColor = UIColor.customBlueColor()
        bluePoint.layer.cornerRadius = bluePoint.frame.width/2
        bluePoint.clipsToBounds = true
        if CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(320, 480)){
            bluePoint.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2 - 100, (UIScreen.mainScreen().bounds.height-200)/1.2)
        }
        else{
            bluePoint.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2 - 100, (UIScreen.mainScreen().bounds.height-200)/1.5)
        }
        
        self.view.addSubview(bluePoint)
        
        let blueLabel = UILabel(frame: CGRectMake(bluePoint.frame.origin.x + 25, bluePoint.frame.origin.y-3, 0, 0))
        blueLabel.text = "Programming"
        blueLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        blueLabel.sizeToFit()
        self.view.addSubview(blueLabel)
        
        let greenPoint = UIView(frame: CGRectMake(0, 0, 15, 15))
        greenPoint.center = bluePoint.center
        greenPoint.center.y += 25
        greenPoint.backgroundColor = UIColor.customGreenColor()
        greenPoint.layer.cornerRadius = greenPoint.frame.width/2
        greenPoint.clipsToBounds = true
        self.view.addSubview(greenPoint)
        
        let greenLabel = UILabel(frame: CGRectMake(blueLabel.frame.origin.x, blueLabel.frame.origin.y+25, 0, 0))
        greenLabel.text = "Travelling"
        greenLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        greenLabel.sizeToFit()
        self.view.addSubview(greenLabel)
        
        let purplePoint = UIView(frame: CGRectMake(0, 0, 15, 15))
        purplePoint.center = greenPoint.center
        purplePoint.center.y += 25
        purplePoint.backgroundColor = UIColor.customPurpleColor()
        purplePoint.layer.cornerRadius = purplePoint.frame.width/2
        purplePoint.clipsToBounds = true
        self.view.addSubview(purplePoint)
        
        let purpleLabel = UILabel(frame: CGRectMake(greenLabel.frame.origin.x, greenLabel.frame.origin.y+25, 0, 0))
        purpleLabel.text = "Movies & TV Shows"
        purpleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        purpleLabel.sizeToFit()
        self.view.addSubview(purpleLabel)
        
        let redPoint = UIView(frame: CGRectMake(0, 0, 15, 15))
        redPoint.center = purplePoint.center
        redPoint.center.y += 25
        redPoint.backgroundColor = UIColor.customRedColor()
        redPoint.layer.cornerRadius = redPoint.frame.width/2
        redPoint.clipsToBounds = true
        self.view.addSubview(redPoint)
        
        let redLabel = UILabel(frame: CGRectMake(purpleLabel.frame.origin.x, purpleLabel.frame.origin.y+25, 0, 0))
        redLabel.text = "Sports"
        redLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        redLabel.sizeToFit()
        self.view.addSubview(redLabel)
        
        let yellowPoint = UIView(frame: CGRectMake(0, 0, 15, 15))
        yellowPoint.center = redPoint.center
        yellowPoint.center.y += 25
        yellowPoint.backgroundColor = UIColor.customYellowColor()
        yellowPoint.layer.cornerRadius = yellowPoint.frame.width/2
        yellowPoint.clipsToBounds = true
        self.view.addSubview(yellowPoint)
        
        let yellowLabel = UILabel(frame: CGRectMake(redLabel.frame.origin.x, redLabel.frame.origin.y+25, 0, 0))
        yellowLabel.text = "Delicious food"
        yellowLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        yellowLabel.sizeToFit()
        self.view.addSubview(yellowLabel)
        
        
    }

    
    
    
    //MARK: - Configure Circle
    

    
    func configureCircleView(){
        self.addCircleView(200, color: UIColor.customBlueColor(), width: 3,toEnd : 0.8)
        self.addCircleView(180, color: UIColor.customGreenColor(), width: 3,toEnd : 0.85)
        self.addCircleView(160, color: UIColor.customPurpleColor(), width: 3,toEnd : 0.6)
        self.addCircleView(140, color: UIColor.customRedColor(), width: 3,toEnd : 0.4)
        self.addCircleView(120, color: UIColor.customYellowColor(), width: 3,toEnd : 0.75)
        for view in self.circleViewArray{
            self.view.addSubview(view as! SkillCycleView)
        }
    }
    
    func addCircleView(r : CGFloat, color : UIColor, width : CGFloat, toEnd : CGFloat){
        let circleView  = SkillCycleView(frame: CGRectMake(0, 0, r, r), color: color, width: width)
        circleView.toEnd = toEnd
        if CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(320, 480)){
            circleView.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2, (UIScreen.mainScreen().bounds.height-200)/2.5)
        }
        else{
            circleView.center = CGPointMake((UIScreen.mainScreen().bounds.width-50)/2, (UIScreen.mainScreen().bounds.height-200)/3)
        }
        
        self.circleViewArray.addObject(circleView)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }

}
