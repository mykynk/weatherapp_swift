//
//  hourly.swift
//  weatherapp
//
//  Created by Muhammed Yusuf Kaynak on 7.08.2022.
//

import SwiftUI

struct Hourly: View {
    var weatherModel: Weather
    
    init(weatherModel: Weather){
        self.weatherModel = weatherModel
    }
    var body: some View {
        VStack(alignment: .leading){
            Text("HOURLY").font(.body).foregroundColor(Color.white)
            ScrollView(.horizontal){
                
                HStack{
                    ForEach(0..<23){ i in
                        let hourly = weatherModel.forecast.forecastday[ ((i+hour) < 24) ? 0 : 1 ].hour[((i+hour) < 24) ? (i+hour) : i - (24-hour) ]
                        VStack( spacing: 5){
                            Text("\(hourly.time.substring(from: 10))")
                            Text("\(hourly.condition.text)")
                            Text("\(String(format: "%1.1f",hourly.tempC))")
                        }.padding(.all, 8)
                    }
                    
                }.padding(.all,8).foregroundColor(Color.black)
            }.background(
                RoundedRectangle(
                    cornerRadius: 10)
                .foregroundColor(Color.white.opacity(0.4)))
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

