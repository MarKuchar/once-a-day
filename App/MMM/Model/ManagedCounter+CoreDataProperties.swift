//
//  ManagedCounter+CoreDataProperties.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-12-19.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedCounter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedCounter> {
        return NSFetchRequest<ManagedCounter>(entityName: "ManagedCounter")
    }

    @NSManaged public var currentCount: Int64
    @NSManaged public var title: String?
    @NSManaged public var todayDone: Date?

}

extension ManagedCounter : Identifiable {

}
