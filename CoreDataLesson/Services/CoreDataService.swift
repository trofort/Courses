//
//  CoreDataService.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import Foundation
import CoreData

final class CoreDataService {
    
    static var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack

    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataLesson")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    static func saveContext() {
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
