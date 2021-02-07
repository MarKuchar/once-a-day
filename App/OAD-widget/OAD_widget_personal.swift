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
            
            Image("AppIcon_3")
                .resizable()
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(0.2)
            
            VStack {
                
                Text("You have contributed")
                    .font(.custom("NewYorkLarge-MediumItalic", size: 16))
                
                Text("\(entry.count)")
                    .font(.custom("NewYorkExtraLarge-Semibold", size: 50))
                    .foregroundColor(Color(UIConstants.customBlue))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 7).padding(.bottom, 7)
                
                Text(entry.count == 1 ? "time." : "times.")
                    .font(.custom("NewYorkLarge-MediumItalic", size: 16))
            }
        }
    }
    
    struct OnceADayWidget_Previews: PreviewProvider {
        static var previews: some View {
            WidgetPersonalEntryView(entry: UserCountEntry(date: Date(), count: 1, countWorld: 1))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
