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

    }
    
    // MARK: -  Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0){
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ClubViewController") as ClubViewController
            vc.transitioningDelegate = self
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.parentViewController!.presentViewController(vc, animated: true, completion: {println("hh")})
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
