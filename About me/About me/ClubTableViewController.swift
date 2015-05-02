//
//  ClubTableViewController.swift
//  About me
//
//  Created by Nathan on 4/27/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class ClubTableViewController: UITableViewController {

    @IBOutlet weak var iconView: UIView!
    
    
    var iconImageViewArray = NSMutableArray()
    var labelHeight : CGFloat = 0
    var describeLabel : UILabel!
    
    let unitWidthSmall = (UIScreen.mainScreen().bounds.width-70)/21
    let unitWidthLarge = (UIScreen.mainScreen().bounds.width)/21
    
    
    //MARK: - Life Cycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("shrinkIcon"), userInfo: nil, repeats: false)
        NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: Selector("showDescribeLabel"), userInfo: nil, repeats: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureImageView()
        self.configureTextField()

        
    }

    //MARK: - Table View Delegate
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return (UIScreen.mainScreen().bounds.width-70)+labelHeight
        }
        else{
            return 0
        }
    }
    
    //MARK: - UI Configure
    
    func configureImageView(){
        for(var i = 0; i < 16; i++){
            var imageName = "club_icon_\(i)"
            self.iconImageViewArray.addObject(UIImageView(image: UIImage(named: imageName)))
        }
        
        for(var i = 0; i < 4 ; i++){
            for(var j = 0; j < 4; j++){
                let imageView = self.iconImageViewArray.objectAtIndex(4*i+j) as UIImageView
                let iFloat = CGFloat(i)
                let jFloat = CGFloat(j)
                imageView.frame = CGRectMake((0.5+5*iFloat)*unitWidthLarge-25, (0.5+5*jFloat)*unitWidthLarge-100, 4*unitWidthLarge, 4*unitWidthLarge)
                imageView.layer.cornerRadius = 8
                imageView.clipsToBounds = true
                imageView.layer.opacity = 0
                imageView.tag = 4*i+j
                self.iconView.addSubview(imageView)
            }
        }
    }
    
    func configureTextField(){

        describeLabel = UILabel()
        describeLabel.frame = CGRectMake(10+unitWidthSmall,  (UIScreen.mainScreen().bounds.width-70),  (UIScreen.mainScreen().bounds.width-90-2*unitWidthSmall),  (UIScreen.mainScreen().bounds.width-70));
        describeLabel.text = "In Tongji Apple Club\n\nWe focus on iOS and Mac development\n\nWe’ve been passed through for 10 years\n\nWe’ve made many honourable things\n\nThis is the 1st Apple Student Club in China\n\nwe’ve launched over 40 applications\n\n300 members with proficient iOS develop or design skills walked out from here\n\nOur apps have been downloaded for 9 million times"
        describeLabel.numberOfLines = 0
        describeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        describeLabel.textColor = UIColor.blackColor()
        describeLabel.sizeToFit()
        describeLabel.layer.opacity = 0
        self.labelHeight = describeLabel.frame.size.height
        self.iconView.addSubview(describeLabel)
        
        
    }
    
    
    //MARK: - Animation
    
    func shrinkIcon(){
        let shrinkAnimation = POPSpringAnimation(propertyNamed: kPOPLayerSize)
        shrinkAnimation.toValue = NSValue(CGSize:CGSizeMake(4*unitWidthSmall, 4*unitWidthSmall))
        shrinkAnimation.removedOnCompletion = true
//        shrinkAnimation.duration = 2.0
//        shrinkAnimation.springBounciness = 4
//        shrinkAnimation.springSpeed = 0
        
        let opacityAnimation = POPSpringAnimation(propertyNamed: kPOPLayerOpacity)
        opacityAnimation.toValue = 1.0
        opacityAnimation.removedOnCompletion = true
//        opacityAnimation.duration = 2.0
//        opacityAnimation.springBounciness = 4
//        opacityAnimation.springSpeed = 0
        

        
        for imageView in iconImageViewArray{
            let iconView = imageView as UIImageView
            let iFloat = CGFloat(imageView.tag/4)
            let jFloat = CGFloat(imageView.tag%4)
            let positionAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPosition)
            positionAnimation.toValue = NSValue(CGPoint: CGPointMake((1+5*iFloat)*unitWidthSmall+25, (1+5*jFloat)*unitWidthSmall+25))
            positionAnimation.removedOnCompletion = true
//            positionAnimation.duration = 2.0
//            positionAnimation.springBounciness = 0
//            positionAnimation.springSpeed = 0
            iconView.layer.pop_addAnimation(shrinkAnimation, forKey: "shrinkAnimation")
            iconView.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimation")
            iconView.layer.pop_addAnimation(positionAnimation, forKey: "positionAnimation")
        }
        
    }
    
    func showDescribeLabel(){
        self.tableView.clipsToBounds = true
        let opacityAnimation = POPSpringAnimation(propertyNamed: kPOPLayerOpacity)
        opacityAnimation.toValue = 1.0
        opacityAnimation.springBounciness = 4
        opacityAnimation.springSpeed = 0
        opacityAnimation.removedOnCompletion = true
        self.describeLabel.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimation")
    }
    
    
    
}
