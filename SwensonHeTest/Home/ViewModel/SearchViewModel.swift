//
//  SearchViewModel.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 6/2/23.
//

import Foundation

@MainActor
class SearchViewModel: APIRequestable, ObservableObject  {
    
    @Published var searchResponse: [Location]?
    @Published var errorMessage: String?
    
    func getSearchList(searching: String) {
        
        Task {
            do {
                let response = try await request(service: WeatherService.search(key: "fe2434c0cd1b480cac8162214222712",
                                                                                  query: searching),
                                                 modelType: [Location].self)

                print(response)
                searchResponse = response
                errorMessage = nil
            } catch {
                print("error en SearchViewModel \(error)")
                print(error.localizedDescription)
                errorMessage = error.localizedDescription
            }
        }
    }
}
