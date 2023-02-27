//
//  MainForecast.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 24/1/23.
//

import SwiftUI

struct MainForecast: View {
    var todayWeather: TodayWeather
    private let imagePercent = 0.16
    private let fontPercent: CGFloat = 0.06
    
    var body: some View {
        let imageSize: CGFloat = UIScreen.main.bounds.width * imagePercent
        let fontSize: CGFloat = UIScreen.main.bounds.width * fontPercent
        
            VStack (spacing: 0){
                AsyncImage(url: todayWeather.condition.url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize, height: imageSize)
                        
                } placeholder: {
                    ProgressView()
                }
                
                Text(
                    format(grade: todayWeather.temp_f.removeZerosFromEnd(), fontsize: fontSize)
                    +
                    format(symbol:"˚F", fontsize: fontSize)
                )
                .lineSpacing(1.33)
                .foregroundColor(.white)
                
                
                Text(todayWeather.condition.text)
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .padding()
                
                HStack(spacing: 20){
                    
                    WeatherIcons(image: "wind", text:"\(todayWeather.wind.removeZerosFromEnd()) mph")
                    WeatherIcons(image: "humidity", text: "\(todayWeather.humidity.removeZerosFromEnd())%")
                }
            }
//            .border(.red)
//            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
//        }
//        .border(.red)
    }
    private func format(grade: String, fontsize: CGFloat) -> AttributedString {
        var attributed = AttributedString(grade)
        attributed.font = .system(size: fontsize).weight(.medium)
        
        return attributed
    }
    private func format(symbol: String, fontsize: CGFloat) -> AttributedString {
        var attributed = AttributedString(symbol)
        attributed.font = .system(size: fontsize).weight(.thin)
        
        return attributed
    }
}

//
//struct MainForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//      MainForecast(forecast: <#T##Forecast#>)
//    }
//}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = (self.description.components(separatedBy: ".").last)!.count
        return String(formatter.string(from: number) ?? "")
    }
}

struct WeatherIcons: View {
    var image: String
    var text: String
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 22, height: 22)
            Text(text)
                .font(.callout)
                .fontWeight(.regular)
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
        }
    }
}
