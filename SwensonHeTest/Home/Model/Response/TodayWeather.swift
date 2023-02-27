//
//  TodayWeather.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 28/12/2022.
//

import Foundation

struct TodayWeather: Decodable {
    let wind: Double
    let humidity: Double
    let condition: WeatherCondition
    let temp_c: Double
    let temp_f: Double
    
    
    enum CodingKeys: String, CodingKey {
        case wind = "wind_mph"
        case humidity
        case condition
        case temp_c
        case temp_f
        
    }
}
