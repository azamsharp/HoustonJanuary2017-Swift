//
//  FirstViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let fadeTransition = FadeTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return fadeTransition
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        
    }
    
}
