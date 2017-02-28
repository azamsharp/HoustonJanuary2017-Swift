//
//  ViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 2/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DetailsViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func detailsViewControllerDidSave(name: String) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*
         
             (DetailsViewController *) segue.destination
         
         */
        
        let detailsVC = segue.destination as! DetailsViewController
        detailsVC.delegate = self
        
        
    }

}

