//
//  OAD_widget.swift
//  OAD-widget
//
//  Created by Martin Kuchar on 2021-02-04.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import WidgetKit
import SwiftUI
import FirebaseDatabase

//struct Provider: TimelineProvider {
//
//    let container = CoreDataManager.shared.persistentContainer
//
//    let refTotalCount = Database.database().reference().child("totalCount")
//
//    let txt = ""
//
//
//    func placeholder(in context: Context) -> UserCountEntry {
//        UserCountEntry(date: Date(), count: 1, countWorld: 1)
//    }
//
//    private func getLocal() -> Int64 {
//        let context = container.viewContext
//        let counter = ManagedCounter.saveOrGet(context: context)
//        let currentCount = counter.currentCount
//        return currentCount
//    }
//
//    private func getEntry(completion: @escaping (_ local: Int64, _ world: Int64) -> ()) {
//        refTotalCount.getData(completion: { (_, snapshot) in
//            if let currentTotal = snapshot.value as? Int64  {
//                let local = self.getLocal()
//                let world = currentTotal
//                completion(local, world)
//            }
//        })
//    }
//
////    func getSnapshot(in context: Context, completion: @escaping (UserCountEntry) -> ()) {
////        getEntry(completion: { (local, world) in
////            let entry = UserCountEntry(date: Date(), count: local, countWorld: world)
////            completion(entry)
////        })
////    }
//
//    func getSnapshot(in context: Context, completion: @escaping (UserCountEntry) -> ()) {
////        let currentCount = 1
//        let entry = UserCountEntry(date: Date(), count: 1, countWorld: 1)
//        completion(entry)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<UserCountEntry>) -> ()) {
//        var entries: [UserCountEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
////                let entryDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
//        for hourOffset in 0 ..< 5 {
////            getEntry(completion: { (local, world) in
//                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//                let entry = UserCountEntry(date: entryDate, count: 1, countWorld: 1)
//                entries.append(entry)
////            })
//        }
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//
//    }
//}

struct Provider: TimelineProvider {
    
    let container = CoreDataManager.shared.persistentContainer
    
    let txt = ""
    
    //    let refTotalCount = Database.database().reference().child("totalCount")
    
    func placeholder(in context: Context) -> UserCountEntry {
        
        UserCountEntry(date: Date(), count: 1, countWorld: 1)
    }
    
    private func getEntry() -> Int64 {
        let context = container.viewContext
        let counter = ManagedCounter.saveOrGet(context: context)
        let currentCount = counter.currentCount
        return currentCount
    }
    
    func getSnapshot(in context: Context, completion: @escaping (UserCountEntry) -> ()) {
        let currentCount = getEntry()
        let entry = UserCountEntry(date: Date(), count: currentCount, countWorld: 1)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<UserCountEntry>) -> ()) {
        var entries: [UserCountEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let currentCount = self.getEntry()
            let entry = UserCountEntry(date: entryDate, count: currentCount, countWorld: 1)
            entries.append(entry)
            
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
        
    }
}
