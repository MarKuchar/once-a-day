//
//  CoreDataManager.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-11-10.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() { }
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MMM")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
