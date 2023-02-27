//
//  Double + SwensonHTest.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 27/2/23.
//

import Foundation

extension Double {
    var dateFullFormat: String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM yyyy"
        return formatter.string(from: date)
    }
}

