//
//  Details.swift
//  weatherapp
//
//  Created by Muhammed Yusuf Kaynak on 7.08.2022.
//

import SwiftUI

let screenSize: CGRect = UIScreen.main.bounds


struct Details: View {
    var weatherModel: Weather
    init(weatherModel: Weather){
        self.weatherModel = weatherModel
    }
    var body: some View {
        VStack  {
            let current : Current = weatherModel.current
            Text("DETAILS").frame(width: screenSize.width*0.9,alignment: .leading).foregroundColor(Color.white).padding(.top,8)
            HStack{
                VStack () {
                    VStack(spacing: 10){
                        Text("Wind").fontWeight(.bold)
                        Text("\(String(format: "%1.1f",current.windKph)) Km/h")
                    }.padding()
                    
                    VStack(spacing: 10){
                        Text("Visibility").fontWeight(.bold)
                        Text("\(String(format: "%1.f",current.visKM)) km")
                    }.padding()
                
                }.frame(width:screenSize.width*0.45).padding(.vertical,16)
                VStack(){
                    VStack(spacing: 10){
                        Text("Humidity").fontWeight(.bold)
                        Text("\(String(format: "%1.f",current.humidity)) %")
                    }.padding()
                    VStack(spacing: 10){
                        Text("Precipitation").fontWeight(.bold)
                        Text("\(String(format: "%1.f",current.precipMm)) mm")
                    }.padding()
                }.frame(width:screenSize.width*0.45)
                
            }.foregroundColor(Color.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white.opacity(0.3)))
        }
        
        
        
    }
}
