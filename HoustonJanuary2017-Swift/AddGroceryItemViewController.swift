//
//  AddGroceryItemViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/2/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreData

class AddGroceryItemViewController: UIViewController {

    var managedObjectContext :NSManagedObjectContext!
    var groceryCategory :GroceryCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addGroceryItemButtonPressed(_ sender: Any) {
        
        let groceryItem = GroceryItem(context: self.managedObjectContext)
        groceryItem.title = "Fish"
        groceryItem.groceryCategory = groceryCategory
        
        try! self.managedObjectContext.save()
    }
}
