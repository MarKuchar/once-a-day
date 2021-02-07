//
//  UserCountEntry.swift
//  OnceADayWidgetExtension
//
//  Created by Tushar Chhabra on 2021-01-31.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import Foundation
import WidgetKit

struct UserCountEntry: TimelineEntry {
    let date: Date
    let count: Int64
    let countWorld: Int64
}
