//
//  HelloViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/6/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class HelloViewController : UIViewController {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.indicatorView.isHidden = true
    }
    
    @IBAction func buttonPressed() {
        
        self.indicatorView.isHidden = false
        self.indicatorView.startAnimating()
        
        // background // lane for time consuming tasks
        DispatchQueue.global().async {
            self.doSomethingTimeConsuming()
            
            // switch to the main thread to run UI specific tasks 
            DispatchQueue.main.async {
                self.indicatorView.stopAnimating()
                self.indicatorView.isHidden = true
            }
            
        }
        
    }
    
    private func doSomethingTimeConsuming() {
        
        sleep(5);
        
    }
    
}





