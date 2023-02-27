//
//  Location.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 28/12/2022.
//

import Foundation

struct Location: Decodable, Hashable {
    let name: String
    let region: String
    let country: String
    let localtime: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case localtime = "localtime_epoch"
    }
}
