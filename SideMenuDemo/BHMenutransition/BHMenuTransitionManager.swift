
//  Created by Nattapong Unaregul on 13/2/18.
import UIKit
@objc protocol BHMenuTransitionManagerDelegate {
    @objc optional func requestDismiss()
}

class BHMenuTransitionManager: NSObject {
    var delegate : BHMenuTransitionManagerDelegate?
    var transitionAnimator : BHMenuTransitionAnimator!
    var presentationAnimator : BHMenuPresentation?
    lazy var interactionTransition = BHMenuInteraction()
    init(instance :  BHMenuTransitionManagerDelegate
        ,fromViewController vc: UIViewController ) {
        super.init()

        transitionAnimator =  BHMenuTransitionAnimator(fromViewController: vc)
        self.delegate = instance
    }
}

extension BHMenuTransitionManager : UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transitionAnimator
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transitionAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return nil
    }
}
extension BHMenuTransitionManager : BHMenuPresentationDelegate {
    func requestDismiss() {
        delegate?.requestDismiss?()
    }
}
