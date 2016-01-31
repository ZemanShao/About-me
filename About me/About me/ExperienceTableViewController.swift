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
    
    @IBAction func firstRowButtonPressed(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ClubViewController") as! ClubViewController
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func secondRowButtonPressed(sender: AnyObject) {
        let vc = SkillViewController()
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func thirdRowButtonPressed(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("WorkViewController") as! WorkViewController
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func fourthRowButtonPressed(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("CoolViewController")as! CoolViewController
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func fifthRowButtonPressed(sender: AnyObject) {
        let vc = FultureViewController()
        vc.transitioningDelegate = self;
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(vc, animated: true, completion: nil)
    }

    
    // MARK: - Transitioning Delegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ExperiencePresentingAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ExperienceDismissingAnimator()
    }
    
    
    
}
