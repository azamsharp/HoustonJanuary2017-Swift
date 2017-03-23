//
//  FadeTransition.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class FadeTransition : NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var originalFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)
        
        originalFrame = (toView?.frame)!
        toView?.frame = CGRect.zero
        
//        toView?.alpha = 0
        
        containerView.addSubview(toView!)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            toView?.frame = self.originalFrame
            
            
        }) { (_) in
            
             transitionContext.completeTransition(true)
            
        }
        
        
//        UIView.animate(withDuration: duration, animations: { 
//            
//            toView?.alpha = 1
//            
//            
//        }) { (_) in
//            
//            transitionContext.completeTransition(true)
//            
//        }
        
        
        
    }
    
}
