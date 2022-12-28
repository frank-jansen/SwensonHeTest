//
//  HomeViewModel.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 27/12/2022.
//

import SwiftUI

class HomeViewModel: APIRequestable, ObservableObject  {
    
    @Published var forecast: [Forecast] = .init()
    @Published var errorMessage: String?
    
    func getForecast() {
        Task {
            do {
                let response = try await request(service: WeatherService.forecast(key: "fe2434c0cd1b480cac8162214222712",
                                                                                  query: "london",
                                                                                  days: 3),
                                               model: ForecastResponse.self)
                
                print(response)
                
                forecast = response.forecast
                errorMessage = nil
            } catch {
                print("error \(error)")
                errorMessage = error.localizedDescription
            }
        }
    }
    
}
