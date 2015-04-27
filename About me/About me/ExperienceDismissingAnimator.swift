//
//  ExperienceDismissingAnimator.swift
//  About me
//
//  Created by Nathan on 4/26/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class ExperienceDismissingAnimator: NSObject, UIViewControllerAnimatedTransitioning{
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        toVC.view.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        let subviews = transitionContext.containerView().subviews as NSArray
        let dimmingView = subviews.firstObject as UIView
        
        let opacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        opacityAnimation.toValue = 0
        
        
        let positionAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        positionAnimation.toValue = transitionContext.containerView().center.x*4
        positionAnimation.springBounciness = 10
        positionAnimation.completionBlock = {(anim : POPAnimation?,finished : Bool) in transitionContext.completeTransition(true)}
        
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.springBounciness = 20
        scaleAnimation.toValue = NSValue(CGPoint: CGPointMake(1.2, 1.4))

        fromVC.view.layer.pop_addAnimation(positionAnimation, forKey: "positionAnimation")
        fromVC.view.layer.pop_addAnimation(scaleAnimation, forKey: "scaleAnimation")
        dimmingView.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimation")
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
}
