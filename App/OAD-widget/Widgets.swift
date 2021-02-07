//
//  Widgets.swift
//  OAD-widgetExtension
//
//  Created by Martin Kuchar on 2021-02-07.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import WidgetKit
import SwiftUI
import Firebase

struct Widgets {
    struct OnceADayWidgetPersonal: Widget {

        let kind: String = "OAD_widget_personal_count"
        
        var body: some WidgetConfiguration {
            StaticConfiguration(kind: kind, provider: Provider()) { entry in
                WidgetPersonalEntryView(entry: entry)
            }
            .configurationDisplayName("My total contribution")
            .description("My total contribution.")
        }
    }
    
    struct OnceADayWidgetWorld: Widget {
    
        let kind: String = "OAD_widget_world_count"
        
        var body: some WidgetConfiguration {
            StaticConfiguration(kind: kind, provider: Provider()) { entry in
                WidgetWorldEntryView(entry: entry)
            }
            .configurationDisplayName("World's total contribution")
            .description("World's total contribution.")
        }
    }
    
    @main
    struct OnceADayWidget: WidgetBundle {
//        init() {
//            FirebaseApp.configure()
//        }
        var body: some Widget {
            OnceADayWidgetPersonal()
//            OnceADayWidgetWorld()
        }
    }
}

