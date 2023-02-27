//
//  String+SwensonHeTest.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 26/2/23.
//

import Foundation

extension String {
    func weekdayName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self),
              let weekdaySymbols = dateFormatter.weekdaySymbols else {
            return ""
        }
        
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if date == tomorrow {
            return "Tomorrow"
        } else {
            return weekdaySymbols[weekday - 1]
        }
    }
}
