//
//  Customer+CoreDataClass.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//
//

import Foundation
import CoreData

@objc(Customer)
public class Customer: NSManagedObject {

    convenience init?(moc: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Customer",
                                                   in: moc) {
            self.init(entity: entity, insertInto: moc)
        } else {
            return nil
        }
    }
    
}
