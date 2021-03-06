//
//  GroceryCategoriesTableViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 2/28/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreData

class GroceryCategoriesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var groceryCategories :[GroceryCategory]!
    var managedObjectContext :NSManagedObjectContext!
    
    var fetchResultsController :NSFetchedResultsController<GroceryCategory>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = NSFetchRequest<GroceryCategory>(entityName: "GroceryCategory")
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        self.fetchResultsController.delegate = self
        
        try! self.fetchResultsController.performFetch()
    }
    
    
    @IBAction func addNewGroceryCategory() {
        
        let groceryCategory = GroceryCategory(context: self.managedObjectContext)
        groceryCategory.title = "Aldi"
        
        try! self.managedObjectContext.save()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // delete the record
            
            let groceryCategory = self.fetchResultsController.object(at: indexPath)
            
            self.managedObjectContext.delete(groceryCategory)
            
            try! self.managedObjectContext.save()
            
        }
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if type == .insert {
            
            self.tableView.insertRows(at: [newIndexPath!], with: .automatic)
        }
        else if type == .delete {
            
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return self.groceryCategories.count
        
        guard let sections = self.fetchResultsController.sections else {
            return 0
        }
        
        return sections[section].numberOfObjects
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("No selection made")
        }
        
        let groceryCategory = self.fetchResultsController.object(at: indexPath)
        
        let addGroceryItemVC = segue.destination as! AddGroceryItemViewController
        
        addGroceryItemVC.managedObjectContext = self.managedObjectContext
        addGroceryItemVC.groceryCategory = groceryCategory
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let groceryCategory = self.fetchResultsController.object(at: indexPath)
        
        let groceryItems = groceryCategory.groceryItems?.allObjects as! [GroceryItem]
        
        
        cell.textLabel?.text = groceryCategory.title

        return cell
    }
    

}
