//
//  Location.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 28/12/2022.
//

import Foundation

struct Location: Decodable {
    let name: String
    /// epoch
    let date: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case date = "localtime_epoch"
    }
}
