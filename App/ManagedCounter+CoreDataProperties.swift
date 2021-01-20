//
//  ManagedCounter+CoreDataProperties.swift
//  
//
//  Created by Martin Kuchar on 2021-01-20.
//
//

import Foundation
import CoreData


extension ManagedCounter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedCounter> {
        return NSFetchRequest<ManagedCounter>(entityName: "ManagedCounter")
    }

    @NSManaged public var currentCount: Int64
    @NSManaged public var isFirstLaunch: Bool
    @NSManaged public var title: String?
    @NSManaged public var todayDone: Date?

}
