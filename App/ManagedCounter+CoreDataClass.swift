//
//  ManagedCounter+CoreDataClass.swift
//  
//
//  Created by Martin Kuchar on 2021-01-20.
//
//

import Foundation
import CoreData

@objc(ManagedCounter)
public class ManagedCounter: NSManagedObject {
    class func saveOrGet(context: NSManagedObjectContext) -> ManagedCounter {
        let request: NSFetchRequest<ManagedCounter> = ManagedCounter.fetchRequest()
        request.predicate = NSPredicate(format: "title = %@", "Main")
        do {
            let matches = try! context.fetch(request)
            if matches.count > 0 {
                return matches.first!
            }
        }
        let counter = ManagedCounter(context: context)
        counter.title = "Main"
        counter.currentCount = 0
        try? context.save()
        return counter
    }
}
