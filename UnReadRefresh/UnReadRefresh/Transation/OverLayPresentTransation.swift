//
//  OverLayPresentTransation.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/17.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit

class OverLayPresentTransation: NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let toVc = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        containerView.addSubview(toVc.view)
        
        toVc.view.alpha = 0
        
        let during = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: during, animations: { 
            toVc.view.alpha = 0.9
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }
}
