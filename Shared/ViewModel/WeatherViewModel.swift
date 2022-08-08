//
//  WeatherViewModel.swift
//  weatherapp (iOS)
//
//  Created by Muhammed Yusuf Kaynak on 8.08.2022.
//

import Foundation

class WeatherViewModel : ObservableObject {
    private var apiService : APIService!
    @Published var isCompleted : Bool = false
    @Published var wtData : Weather! {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController : (() -> ()) = {}
    
    init() {
        self.apiService =  APIService()
        callFuncToGetWtData()
    }
    
    func callFuncToGetWtData() {
        self.apiService.apiToGetWeatherData { (wtData) in
            self.wtData = wtData
            print(wtData)
            self.isCompleted = true
            print(self.isCompleted)
            
        }
    }
}
