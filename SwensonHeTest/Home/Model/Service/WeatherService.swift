//
//  WeatherService.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 27/12/2022.
//

import Foundation

// Guide: https://www.advancedswift.com/a-guide-to-urls-in-swift/ and https://matteomanferdini.com/swift-url-components/

enum WeatherService {
    case current(key: String, query: String)
    case forecast(key: String, query: String, days: Int)
    case search(key: String, query: String)
}

extension WeatherService: Service {
    var base: String { return "https://api.weatherapi.com/v1/" }
    
    // this can be refactor because we start seeing a lot of URLQueryItem
    var path: String {
        var components = URLComponents()
        switch self {
        case let .current(key, query):
            components.path = "current.json"
            components.queryItems = [
                URLQueryItem(name: "key", value: key),
                URLQueryItem(name: "q", value: query)
            ]
        case let .forecast(key, query, days):
            components.path = "forecast.json"
            components.queryItems = [
                URLQueryItem(name: "key", value: key),
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "days", value: "\(days)")
            ]
            
        case let .search(key, query):
            components.path = "search.json"
            components.queryItems = [
                URLQueryItem(name: "key", value: key),
                URLQueryItem(name: "q", value: query)
            ]
        }
        
        return components.string ?? ""
    }
    
    var method: HttpMethod { .get }
}

