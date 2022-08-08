//
//  ContentView.swift
//  Shared
//
//  Created by Muhammed Yusuf Kaynak on 7.08.2022.
//

import SwiftUI
import UIKit
import Foundation



let date = Date()
let calendar = Calendar.current
let hour = calendar.component(.hour, from: date) - 2
let minutes = calendar.component(.minute, from: date)


struct ContentView: View {
    @State private var isPresented = true
    @ObservedObject var weatherViewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 1, green: 0.5, blue: 0.5),Color(red: 0.4627, green: 0.8392, blue: 1.0)], startPoint: .top, endPoint: .bottom)
            ScrollView {
            VStack(alignment: .center) {
                if self.weatherViewModel.isCompleted {
                    let weatherModel = self.weatherViewModel.wtData!
                    Text(weatherModel.location.name)
                         .font(.title)
                         .fontWeight(.bold)
                         .foregroundColor(Color.white)
                         .padding(.top, 100.0)
                    Text(weatherModel.current.condition.text)
                        .font(.headline)
                        .foregroundColor(Color.white)
                    Text("\(String(format: "%1.f",weatherModel.current.tempC))°")
                        .fontWeight(.semibold)
                        .padding(.top,5)
                        .foregroundColor(Color.white)
                        .font(.system(size: 120))
                    Hourly(weatherModel : weatherModel)
                    Days(weatherModel : weatherModel)
                    Details(weatherModel : weatherModel)
                }
                  
                    Spacer()
               }.padding(.all,16)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
            .previewDevice("iPhone 13 Pro Max").ignoresSafeArea()
    }
}

