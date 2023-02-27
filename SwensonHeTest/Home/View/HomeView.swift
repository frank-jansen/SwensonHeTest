//
//  HomeView.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 27/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var viewModel = HomeViewModel()
    @State private var selectectText = "London"
    private let forecastWidthPercent = 0.27
    private let forecastHeightPercent = 0.087
    
    var body: some View {
       
        
        ZStack {
            mainBodyView
            SearchBar(selectectText: $selectectText)
        }
        .frame(maxWidth: .infinity)
        .background(background)
        .onAppear {
            viewModel.getForecast(city: selectectText)
        }
        .onChange(of: selectectText) { _ in
            viewModel.getForecast(city: selectectText)
        }        
    }
    
    var mainBodyView: some View {
       
        
        
        VStack {
            realtimeDate
            
            if let currentLocation = viewModel.forecastResponse?.location {
                LocationNameView(location: currentLocation)
            }
            
            Spacer()
            
            if let current = viewModel.forecastResponse?.current {
                MainForecast(todayWeather: current)
                Spacer()
            }
            
            forecastdays
            Spacer()
        }
    }
    
    var realtimeDate: some View{
        let clock = getCurrentTime()
        
        return Text(clock)
            .foregroundColor(.white)
            .font(.headline)
            .fontWeight(.semibold)
            .lineSpacing(3.5)
            .kerning(0)
            .multilineTextAlignment(.leading)
            .padding()
    }
       
    var errormessage: some View {
        Text(viewModel.errorMessage ?? "")
    }
    
    var forecastdays: some View {
        HStack (spacing: 55) {
            if let forecasts = viewModel.forecastResponse?.forecast {
                ForEach(forecasts, id: \.self) { forecast in
                    ForecastView(forecast: forecast)
                }
            }
        }
    }
    
    var background: some View {
        Group {
            Image("background")
                .resizable()
                .scaledToFill()
            
            LinearGradient(gradient:
                            Gradient(colors: [Color("gradientblue100"),
                                              Color("gradientblue80"),
                                              Color("gradientblue100")]),
                           startPoint: .leading,
                           endPoint: .trailing)
        }
        .ignoresSafeArea()
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: Date())
        
        return dateString
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewInterfaceOrientation(.landscapeRight)
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
        }
    }
}


