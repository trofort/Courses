//
//  RowOfOrder+CoreDataClass.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//
//

import Foundation
import CoreData

@objc(RowOfOrder)
public class RowOfOrder: NSManagedObject {
    convenience init?(moc: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "RowOfOrder",
                                                   in: moc) {
            self.init(entity: entity, insertInto: moc)
        } else {
            return nil
        }
    }
}
