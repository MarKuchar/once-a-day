//
//  OnceADayWIdget.swift
//  OnceADayWIdget
//
//  Created by Tushar Chhabra on 2021-01-31.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let container = CoreDataManager.shared.persistentContainer
//    lazy var currentCount = getEntry()
    
    func placeholder(in context: Context) -> UserCountEntry {
        
        UserCountEntry(date: Date(), count: 1)
    }
    
    private func getEntry() -> Int64 {
        let context = container.viewContext
        let counter = ManagedCounter.saveOrGet(context: context)
        let currentCount = counter.currentCount
        return currentCount
    }

    func getSnapshot(in context: Context, completion: @escaping (UserCountEntry) -> ()) {
//        let currentCount = getEntry()
        let entry = UserCountEntry(date: Date(), count: 1)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [UserCountEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let currentCount = self.getEntry()
            print(currentCount)
            let entry = UserCountEntry(date: entryDate, count: currentCount)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


struct WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color(UIConstants.bgColor)
            
            Image("AppIcon_3")
                .resizable()
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(0.2)
            
            VStack {
//                Text(entry.date, style: .time)
//                    .font(.caption)
                
                Text("\(entry.count)")
                    .font(.custom("NewYorkExtraLarge-Semibold", size: 50))
                    .foregroundColor(Color(UIConstants.customBlue))
                    .padding(.top, 30)
                
                Text("times contributed.")
                    .font(.custom("NewYorkLarge-MediumItalic", size: 16))
                    .padding(.top, 10)
            }
            
        }
    }
}

@main
struct OnceADayWidget: Widget {
    let kind: String = "OnceADayWIdget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct OnceADayWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEntryView(entry: UserCountEntry(date: Date(), count: 1))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
