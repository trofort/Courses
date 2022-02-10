//
//  RowOfOrder+CoreDataProperties.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//
//

import Foundation
import CoreData


extension RowOfOrder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RowOfOrder> {
        return NSFetchRequest<RowOfOrder>(entityName: "RowOfOrder")
    }

    @NSManaged public var sum: Float
    @NSManaged public var order: Order?
    @NSManaged public var service: Service?

}

extension RowOfOrder : Identifiable {

}


//sefsdfsdf
