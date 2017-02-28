//
//  DetailsViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 2/27/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsViewControllerDelegate : class {
    
    func detailsViewControllerDidSave(name :String)
}

class DetailsViewController : UIViewController {
    
    weak var delegate :DetailsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fire the delegate 
       // self.delegate.detailsViewControllerDidSave(name: "John")
    }
    
}


