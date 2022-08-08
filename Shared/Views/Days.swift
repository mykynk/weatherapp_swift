//
//  Days.swift
//  weatherapp
//
//  Created by Muhammed Yusuf Kaynak on 7.08.2022.
//

import SwiftUI

struct Days: View {
    var weatherModel: Weather
    init(weatherModel: Weather){
        self.weatherModel = weatherModel
    }
    var body: some View {
        VStack(alignment: .leading){
            
            Text("DAYS").font(.body).foregroundColor(Color.white).padding(.top,8)
            ForEach(0 ..< 3) { i in
                let forecastday : Forecastday = weatherModel.forecast.forecastday[i]
                HStack(spacing: 20) {
                    let dateMonthIndex = Int(forecastday.date.substring(with: 5..<7)) ?? 1
                    let dateMonth = months[dateMonthIndex - 1].substring(to:3)
                    let dateDay = forecastday.date.substring(from:8)
                    Text("\(dateMonth) \(dateDay)")
                    //Text("*")
                    Spacer()
                    Text(forecastday.day.condition.text).multilineTextAlignment(.center)
                    Spacer()
                    Text("\(String(format: "%1.1f",forecastday.day.avgtempC))")
                }
                .padding(.all, 20)
                .background(
                    RoundedRectangle(
                        cornerRadius: 10)
                    .foregroundColor(Color.white.opacity(0.4)))
                
            }
            
            
        }.frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.black)
    }
}

