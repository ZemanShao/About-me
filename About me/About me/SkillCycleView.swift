//
//  SkillCycleView.swift
//  About me
//
//  Created by Nathan on 1/8/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit


class SkillCycleView: UIView {

    var lineWidth:CGFloat = 4.0
    var lineColor:UIColor = UIColor.blackColor()
    var toEnd : CGFloat = 0.8
    
    private var circleLayer : CAShapeLayer = CAShapeLayer()
    
    init(frame: CGRect, color: UIColor, width : CGFloat) {
        super.init(frame: frame)
        self.lineWidth = width
        self.lineColor = color
        self.addCircleLayer()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    
    func move(strokeEnd:CGFloat, animated:Bool){
        if(animated){
            self.animateToStrokeEnd(strokeEnd)
        }
        else{
            self.circleLayer.strokeEnd = strokeEnd
        }
    }
    
    
    
    
    private func addCircleLayer(){

        let radius = CGRectGetWidth(self.bounds)/2 - lineWidth/2
        let rect = CGRectMake(lineWidth/2, lineWidth/2, radius * 2, radius * 2)
        
        self.circleLayer = CAShapeLayer()
        self.circleLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: radius).CGPath
        self.circleLayer.strokeColor = self.lineColor.CGColor
        self.circleLayer.fillColor = nil
        self.circleLayer.lineWidth = lineWidth
        self.circleLayer.lineCap = kCALineCapRound
        self.circleLayer.lineJoin = kCALineJoinRound
        
        self.layer.addSublayer(self.circleLayer)
        
    }
    
    private func animateToStrokeEnd(strokeEnd:CGFloat){
        var strokeAnimation = POPSpringAnimation(propertyNamed: kPOPShapeLayerStrokeEnd)
        strokeAnimation.toValue = strokeEnd
        strokeAnimation.springSpeed = 0
        strokeAnimation.springBounciness = 4
        strokeAnimation.removedOnCompletion = false
        self.circleLayer.pop_addAnimation(strokeAnimation, forKey: "layerStrokeAnimation")
        
    }

    
}
