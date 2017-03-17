//
//  OverLayDismissTransation.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/17.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit

class OverLayDismissTransation: NSObject,UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let dimissVc = transitionContext.viewController(forKey: .from)!
        let during = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: during, animations: { 
            dimissVc.view.alpha = 0.0
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }


}
