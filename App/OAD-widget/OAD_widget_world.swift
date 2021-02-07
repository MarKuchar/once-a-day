//
//  OAD_widget_world.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-02-07.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import SwiftUI
import WidgetKit

struct WidgetWorldEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color(UIConstants.bgColor)
            
            Image("AppIcon_3")
                .resizable()
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(0.2)
            
            VStack {
                
                Text("World's total contribution:")
                    .font(.custom("NewYorkLarge-MediumItalic", size: 16))
                
                Text("\(entry.countWorld)")
                    .font(.custom("NewYorkExtraLarge-Semibold", size: 50))
                    .foregroundColor(Color(UIConstants.customBlue))
                    .frame(maxWidth: .infinity, alignment: .center)
                    

            }
        }
    }
    
    struct OnceADayWidget_Previews: PreviewProvider {
        static var previews: some View {
            WidgetWorldEntryView(entry: UserCountEntry(date: Date(), count: 2, countWorld: 1))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
