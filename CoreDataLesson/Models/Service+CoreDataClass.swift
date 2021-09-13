//
//  Service+CoreDataClass.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//
//

import Foundation
import CoreData

@objc(Service)
public class Service: NSManagedObject {

    convenience init?(moc: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Service",
                                                   in: moc) {
            self.init(entity: entity, insertInto: moc)
        } else {
            return nil
        }
    }
    
}
