//
//  Forecast.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 27/12/2022.
//

import Foundation

struct Forecast: Decodable, Identifiable {
    
    let date: String
    let day: Day
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}

extension Forecast: Hashable {
    
    struct Day: Decodable, Hashable {
        let minTemp: Double
        let maxTemp: Double
        let condition: WeatherCondition
        
        enum CodingKeys: String, CodingKey {
            case minTemp = "mintemp_f"
            case maxTemp = "maxtemp_f"
            case condition
        }
    }
}
