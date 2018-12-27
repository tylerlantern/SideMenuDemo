//
//  BHMenuTransitionHandler.swift
//  TLT
//
//  Created by Nattapong Unaregul on 13/2/18.
//  Copyright © 2018 Toyata. All rights reserved.
//
import UIKit

class BHMenuTransitionAnimator: NSObject , UIViewControllerAnimatedTransitioning  {

    var fromViewController : UIViewController!

    init(fromViewController vc  : UIViewController ) {
        super.init()
        self.fromViewController = vc
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.33
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        transitionContext.viewController(forKey: .from)
        let fromVc = transitionContext.viewController(forKey: .from)!
        let toVc = transitionContext.viewController(forKey: .to)!
        let isPresenting = self.fromViewController == fromVc ? true : false
        if  isPresenting{
            let targetWidth = fromVc.view.frame.width * 0.85
            toVc.view.frame = CGRect(x: targetWidth * -1, y: 0, width: targetWidth, height: fromVc.view.frame.height)
            containerView.addSubview(toVc.view)
            UIView.animate(withDuration: 0.33, animations: {
                toVc.view.frame.origin.x = 0
            }, completion: { (isDone) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled )
            })
        }else {
            UIView.animate(withDuration: 0.33, animations: {
                fromVc.view.frame.origin.x = fromVc.view.frame.width * -1
            }, completion: { (isDone) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled )
            })
        }
    }
    
}
