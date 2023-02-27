//
//  WeatherCondition.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 28/12/2022.
//

import Foundation

struct WeatherCondition: Decodable, Hashable {
    let text: String
    let icon: String
    var url: URL? {
        URL(string: "https:\(icon)")
    }
}

//https://cdn.weatherapi.com/weather/64x64/day/116.png
