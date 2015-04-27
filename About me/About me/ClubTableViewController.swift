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
    var labelHeight:CGFloat = 0
    
    let unitWidth = (UIScreen.mainScreen().bounds.width-70)/21
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.configureImageView()
        self.configureTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.iconView.frame = CGRectMake(0, 0, (UIScreen.mainScreen().bounds.width-70), (UIScreen.mainScreen().bounds.width-70))
        
    }
    
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
                imageView.frame = CGRectMake((1+5*iFloat)*unitWidth, (1+5*jFloat)*unitWidth, 4*unitWidth, 4*unitWidth)
                imageView.layer.cornerRadius = 8
                imageView.clipsToBounds = true
                self.iconView.addSubview(imageView)
            }
        }
    }
    
    func configureTextField(){
        let describeLabel = UILabel()
        describeLabel.frame = CGRectMake(10+unitWidth,  (UIScreen.mainScreen().bounds.width-70),  (UIScreen.mainScreen().bounds.width-90-2*unitWidth),  (UIScreen.mainScreen().bounds.width-70));
        describeLabel.text = "In Tongji Apple Club\n\nWe focus on iOS and Mac development\n\nWe’ve been passed through for 10 years\n\nWe’ve made many honourable things\n\nThis is the 1st Apple Student Club in China\n\nwe’ve launched over 40 applications\n\n300 members with proficient iOS develop or design skills walked out from here\n\nOur apps have been downloaded for 9 million times"
        describeLabel.numberOfLines = 0
        describeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        describeLabel.textColor = UIColor.blackColor()
        describeLabel.sizeToFit()
        self.labelHeight = describeLabel.frame.size.height
        self.iconView.addSubview(describeLabel)
        
        
    }
    
    
    
    
}
