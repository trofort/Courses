//
//  Customer+CoreDataProperties.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//
//

import Foundation
import CoreData

//I'm be here


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var order: NSSet?

}

// MARK: Generated accessors for order
extension Customer {

    @objc(addOrderObject:)
    @NSManaged public func addToOrder(_ value: Order)

    @objc(removeOrderObject:)
    @NSManaged public func removeFromOrder(_ value: Order)

    @objc(addOrder:)
    @NSManaged public func addToOrder(_ values: NSSet)

    @objc(removeOrder:)
    @NSManaged public func removeFromOrder(_ values: NSSet)

}

extension Customer : Identifiable {

}
