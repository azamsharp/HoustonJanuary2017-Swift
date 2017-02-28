//
//  AppDelegate.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 2/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var managedObjectContext :NSManagedObjectContext!
    
    var persistentStoreContainer :NSPersistentContainer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.persistentStoreContainer = NSPersistentContainer(name: "GrocryDataModel")
        
        self.persistentStoreContainer.loadPersistentStores { (description, error) in
            
            print(description)
        }
        
        // pre iOS 10
       // initializeCoreDataStack()
        
//        guard let addGroceryCategoryVC = self.window?.rootViewController as? AddGroceryCategoryViewController else {
//            fatalError("No root view controller found")
//        }
        
        guard let navController = self.window?.rootViewController as? UINavigationController else {
            fatalError("RootViewController not found")
        }
        
        guard let groceryCategoriesTVC = navController.viewControllers.first as? GroceryCategoriesTableViewController else {
            fatalError("GroceryCategoriesTableViewController is not found")
        }
        
//        guard let groceryCategoriesTVC = self.window?.rootViewController as? GroceryCategoriesTableViewController else {
//            fatalError("No root view controller found")
//        }
//        
        groceryCategoriesTVC.managedObjectContext = self.persistentStoreContainer.viewContext
        
       // addGroceryCategoryVC.managedObjectContext = self.persistentStoreContainer.viewContext
        return true
    }
    
    func initializeCoreDataStack() {
        
        guard let modelURL = Bundle.main.url(forResource: "GrocryDataModel", withExtension: "momd") else {
            fatalError("GrocryDataModel not found")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to initialize ManagedObjectModel")
        }
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let fileManager = FileManager()
        
        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Unable to get documents URL")
        }
        
        let storeURL = documentsURL.appendingPathComponent("Grocry.sqlite")
        
        print(storeURL)
        
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        
        let type = NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType
      
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: type)
        self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
    }

    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

