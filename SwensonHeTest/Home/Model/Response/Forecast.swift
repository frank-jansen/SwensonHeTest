//
//  Forecast.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 27/12/2022.
//

import Foundation

struct Forecast: Decodable {
    
    /// epoch
    let date: Double
    let day: Day
        
    enum CodingKeys: String, CodingKey {
        case date = "date_epoch"
        case day
    }
}

extension Forecast {
    
    struct Day: Decodable {
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
