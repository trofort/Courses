//
//  Service+CoreDataProperties.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//
//

import Foundation
import CoreData


extension Service {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Service> {
        return NSFetchRequest<Service>(entityName: "Service")
    }

    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var rowsOfOrder: NSSet?

}

// MARK: Generated accessors for rowsOfOrder
extension Service {

    @objc(addRowsOfOrderObject:)
    @NSManaged public func addToRowsOfOrder(_ value: RowOfOrder)

    @objc(removeRowsOfOrderObject:)
    @NSManaged public func removeFromRowsOfOrder(_ value: RowOfOrder)

    @objc(addRowsOfOrder:)
    @NSManaged public func addToRowsOfOrder(_ values: NSSet)

    @objc(removeRowsOfOrder:)
    @NSManaged public func removeFromRowsOfOrder(_ values: NSSet)

}

extension Service : Identifiable {

}
