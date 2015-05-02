//
//  ExperiencePresentingAnimator.swift
//  About me
//
//  Created by Nathan on 4/26/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class ExperiencePresentingAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
        fromView.tintAdjustmentMode = UIViewTintAdjustmentMode.Dimmed
        fromView.userInteractionEnabled = true
        
        let dimmingView = UIView(frame: fromView.bounds)
        dimmingView.backgroundColor = UIColor.grayColor()
        dimmingView.layer.opacity = 0.3
        
        let recognizer = UITapGestureRecognizer(target: transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!, action: "backgroundDidPressed")
        dimmingView.addGestureRecognizer(recognizer)
        
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
        if CGSizeEqualToSize(UIScreen.mainScreen().bounds.size, CGSizeMake(320, 480)){
            toView.frame = CGRectMake(0, 0, CGRectGetWidth(transitionContext.containerView().bounds)-50,CGRectGetHeight(transitionContext.containerView().bounds) - 100)
        }
        else{
            toView.frame = CGRectMake(0, 0, CGRectGetWidth(transitionContext.containerView().bounds)-50,CGRectGetHeight(transitionContext.containerView().bounds) - 200)
        }

        toView.center = CGPointMake(-transitionContext.containerView().center.x, transitionContext.containerView().center.y)
        
        transitionContext.containerView().addSubview(toView)
        transitionContext.containerView().insertSubview(dimmingView, atIndex: 0);
        
        let positionAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        positionAnimation.toValue = transitionContext.containerView().center.x
        
        positionAnimation.springBounciness = 10
        positionAnimation.completionBlock = {(anim : POPAnimation?,finished : Bool) in transitionContext.completeTransition(true)}
        
        
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.springBounciness = 20
        scaleAnimation.fromValue = NSValue(CGPoint: CGPointMake(1.2, 1.4))
        
        let opacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        opacityAnimation.toValue = 0.2
        
        toView.layer.pop_addAnimation(positionAnimation, forKey:"positionAnimation")
        toView.layer.pop_addAnimation(scaleAnimation, forKey: "scaleAnimation")
        
        dimmingView.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimation")

        
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5;
    }
}