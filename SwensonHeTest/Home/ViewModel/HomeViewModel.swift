//
//  HomeViewModel.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 27/12/2022.
//

import SwiftUI

@MainActor
class HomeViewModel: APIRequestable, ObservableObject  {
    
    @Published var forecastResponse: ForecastResponse?
    @Published var errorMessage: String?
    
    func getForecast(city: String) {
        Task {
            do {
                let response = try await request(service: WeatherService.forecast(key: "fe2434c0cd1b480cac8162214222712",
                                                                                  query: city,
                                                                                  days: 3),
                                                 modelType: ForecastResponse.self)

                print(response)
                forecastResponse = response
                errorMessage = nil
            } catch {
                print("error en viewmodel \(error)")
                print(error.localizedDescription)
                errorMessage = error.localizedDescription
            }
        }
    }
}
