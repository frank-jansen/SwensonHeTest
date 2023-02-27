//
//  ForecastResponse.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 27/12/2022.
//

import Foundation

// Guide: https://www.donnywals.com/flattening-a-nested-json-response-into-a-single-struct-with-codable/

struct ForecastResponse: Decodable {

    let location: Location
    let current: TodayWeather
    let forecast: [Forecast]
        
    enum OuterKeys: String, CodingKey {
        case location
        case current
        case forecast
    }
    
    enum ForecastKeys: String, CodingKey {
        case forecastday
    }
    
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let forecastContainer = try outerContainer.nestedContainer(keyedBy: ForecastKeys.self,
                                                                   forKey: .forecast)
        location = try outerContainer.decode(Location.self, forKey: .location)
        current = try outerContainer.decode(TodayWeather.self, forKey: .current)
        forecast = try forecastContainer.decode([Forecast].self, forKey: .forecastday)
    }
    
}
