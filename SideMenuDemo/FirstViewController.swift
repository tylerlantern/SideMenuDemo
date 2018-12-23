//
//  ViewController.swift
//  SideMenuDemo
//
//  Created by Nattapong Unaregul on 22/12/2018.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit
protocol dd {
    
}
class FirstViewController: UIViewController {
    lazy var transitionManager = BHMenuTransitionManager(instance: self
        , fromViewController: self.navigationController!)
    @IBAction func action_openSideMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMenu", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMenu"
            , let destVc = segue.destination as? UINavigationController {
            destVc.transitioningDelegate = transitionManager
            destVc.modalPresentationStyle = .custom
        }
    }
    
}

extension FirstViewController : BHMenuTransitionManagerDelegate {
    
}

