//
//  AddGroceryCategoryViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 2/28/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreData

class AddGroceryCategoryViewController: UIViewController {

    var managedObjectContext :NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateGroceryCategories()
        
    }
    
    func populateGroceryCategories() {
        
        let request = NSFetchRequest<GroceryCategory>(entityName: "GroceryCategory")
        request.predicate = NSPredicate(format: "title = %@", "Walmart")
        
       let groceryCategories = try! self.managedObjectContext.fetch(request)
        
        // printing out the contents of array
        print(groceryCategories[0].title!)
        print(groceryCategories[1].title!)
        
        for gc in groceryCategories {
            print(gc.title!)
        }
    }
    
    @IBAction func saveGroceryCategoryButtonPressed() {
       
        let groceryCategory = GroceryCategory(context: self.managedObjectContext)
        
        
//        
        // pre iOS 10
//        let groceryCategory = NSEntityDescription.insertNewObject(forEntityName: "GroceryCategory", into: self.managedObjectContext) as! GroceryCategory
//        
        groceryCategory.title = "Walmart"
        
        try! self.managedObjectContext.save()
        
        
        //groceryCategory.setValue("Walmart", forKey: "title")
        
        
        
        
        
        
        
        
    }

}
