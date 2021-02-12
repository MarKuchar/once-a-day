//
//  OAD_widget_personal.swift
//  OAD-widgetExtension
//
//  Created by Martin Kuchar on 2021-02-07.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import SwiftUI
import WidgetKit

struct WidgetPersonalEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color(UIConstants.bgColor)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 2, content: {
                
                Text("Cleanliness")
                    .font(.custom("NewYorkLarge-MediumItalic", size: 20))
                    .foregroundColor(Color(.customBlack))
                
                Text("\(entry.count)")
                    .font(.custom("NewYorkExtraLarge-Semibold", size: 50))
                    .foregroundColor(Color(.customBlue))
                
                Image("widget-count-underline")
                
            }).padding(.top, 18).padding(.bottom, 33)
            
        }
    }
    
    struct OnceADayWidget_Previews: PreviewProvider {
        static var previews: some View {
            WidgetPersonalEntryView(entry: UserCountEntry(date: Date(), count: 1, countWorld: 1))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
