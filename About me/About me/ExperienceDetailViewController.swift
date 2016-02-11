//
//  ExperienceDetailViewController.swift
//  About me
//
//  Created by Nathan on 4/26/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {
    
    var contentViewController : UIViewController?
    var contentView : UIView?
    
    var contentStr : String?
    var imageUrl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureContentView()
        
        
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
    
    func configureContentView(){
        if let vc = contentViewController {
            self.addChildViewController(vc)
            vc.view.frame = CGRectMake(10, 10, self.view.frame.width-20, self.view.frame.height-20)
            self.view.addSubview(vc.view)
        }
        else if let content = contentStr{
            
            let contentView = MMParallaxPresenter()
            contentView.frame = CGRectMake(10, 10, self.view.frame.width-70, self.view.frame.height-220)
            
            let page = MMParallaxPage(scrollFrame: contentView.frame, withHeaderHeight: 150, andContentText: content)
            
            page.headerView.addSubview(UIImageView(image: UIImage(named: "Cool_robot")))
            contentView.addParallaxPage(page)
            self.view.addSubview(contentView)
        }
        
    }
    
    
    //MARK: - Action
    @IBAction func backgroundDidPressed(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
