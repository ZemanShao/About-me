//
//  ExperienceTableViewController.swift
//  About me
//
//  Created by Nathan on 4/25/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class ExperienceTableViewController: UITableViewController,UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView();

    }
    
    // MARK: - UI Configure
    
    func configureTableView(){
    }
    
    
    // MARK: - Table View Data Source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        
//        return 1
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//
//        return 10
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let objects : NSArray = NSBundle.mainBundle().loadNibNamed("ExperienceTableViewCell", owner: self, options: nil)
//        
//        var cell  = objects.firstObject as ExperienceTableViewCell
//        cell.selectionStyle = UITableViewCellSelectionStyle.None
//        return cell
//    }
//    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 90;
//    }
    
    
    // MARK: -  Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0){
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ClubViewController") as ClubViewController
            vc.transitioningDelegate = self
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.parentViewController!.presentViewController(vc, animated: true, completion: nil)
        }
        else if(indexPath.row == 1){
            let vc = SkillViewController()
            vc.transitioningDelegate = self
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.parentViewController!.presentViewController(vc, animated: true, completion: nil)
        }
        else if(indexPath.row == 2){
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("WorkViewController") as WorkViewController
            vc.transitioningDelegate = self
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.parentViewController!.presentViewController(vc, animated: true, completion: nil)
        }
        else if(indexPath.row == 3){
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("CoolViewController") as CoolViewController
            vc.transitioningDelegate = self
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.parentViewController!.presentViewController(vc, animated: true, completion: nil)
        }
        else if(indexPath.row == 4){
            var vc = FultureViewController()
            vc.transitioningDelegate = self;
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.parentViewController!.presentViewController(vc, animated: true, completion: nil)
        }
        else{
            var vc = ExperienceDetailViewController()
            vc.transitioningDelegate = self;
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.parentViewController!.presentViewController(vc, animated: true, completion: nil)

        }
    }
    
    // MARK: - Transitioning Delegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ExperiencePresentingAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ExperienceDismissingAnimator()
    }
    
    
    
}
