//
//  Order+CoreDataClass.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//
//

import Foundation
import CoreData

@objc(Order)
public class Order: NSManagedObject {
    convenience init?(moc: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Order",
                                                   in: moc) {
            self.init(entity: entity, insertInto: moc)
        } else {
            return nil
        }
    }
}
