//
//  Calculator.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 24/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import SwiftyUserDefaults

extension DefaultsKeys {
    static let dates = DefaultsKey<[Date]>("dates", defaultValue: [])
}

class Calculator {
    static var shareData: [Any] {
        let text = "Day \(dayCount) of #100dayssmiling"
        return [text]
    }
    
    static var dayCount: Int {
        let dates: [Date] = Defaults[.dates]
        return dates.count + 1
    }
    
    static var alreadyShared: Bool {
        let dates: [Date] = Defaults[.dates]
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        return dates.contains(today)
    }
    
    static func record() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        Defaults[.dates].append(today)
    }
    
    static func reset() {
        Defaults[.dates] = []
    }
}