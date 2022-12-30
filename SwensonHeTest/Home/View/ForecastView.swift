//
//  ForecastView.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 29/12/2022.
//

import SwiftUI

struct ForecastView: View {
    
    let iconUrl: URL
    let text: String
    
    var body: some View {
        ZStack {
            Color.blue
            
            VStack {
                AsyncImage(url: iconUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                } placeholder: {
                    ProgressView()
                }
                
                Text(text)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
            }
        }
    }        
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://cdn.weatherapi.com/weather/64x64/day/176.png")!
        return ForecastView(iconUrl: url, text: "82.4°/86°F")
    }
}
