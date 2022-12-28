//
//  TodayWeather.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 28/12/2022.
//

import Foundation

struct TodayWeather: Decodable {
    let wind: Double
    let humidity: Double
    let condition: WeatherCondition
    
    enum CodingKeys: String, CodingKey {
        case wind = "wind_mph"
        case humidity
        case condition
    }
}
