//
//  ForecastView.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 29/12/2022.
//

import SwiftUI

struct ForecastView: View {
    private let imageHeight = 0.05
    private let imageWidth: CGFloat = 0.05
    
    var forecast: Forecast
    
    var body: some View {
        let frameImageHeight = UIScreen.main.bounds.width * imageHeight
        let frameImageWidht = UIScreen.main.bounds.width * imageWidth
        VStack(spacing: 0) {
            AsyncImage(url: forecast.day.condition.url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: frameImageWidht, height: frameImageHeight)
                
            } placeholder: {
                ProgressView()
            }
            
            Text("\(forecast.day.minTemp.removeZerosFromEnd())˚/\(forecast.day.maxTemp.removeZerosFromEnd()) F˚")
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.white)
            
            Text(forecast.date.weekdayName())
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title3)
                .padding(.top, 5)
                
        }
        
    }
}

//struct ForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//      ForecastView(iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/176.png", text: "82.4°/86°F")
//    }
//}
