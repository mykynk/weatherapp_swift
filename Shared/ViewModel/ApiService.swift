//
//  ApiService.swift
//  weatherapp (iOS)
//
//  Created by Muhammed Yusuf Kaynak on 8.08.2022.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&days=6&q=istanbul&aqi=no")!
    
    func apiToGetWeatherData(completion : @escaping (Weather) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let wtData = try! jsonDecoder.decode(Weather.self, from: data)
                    completion(wtData)
            }
        }.resume()
    }
}

/*
extension URLSession {
    func fetchData(at url: URL, completion: @escaping (Result<Weather, Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let wM = try JSONDecoder().decode(Weather.self, from: data)
                    completion(.success(wM))
                    weatherModel = wM
                    
                } catch let decoderError {
                    print("decoderError")
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}
let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=3d44640a7a6a4235834221009220703&days=6&q=istanbul&aqi=no")!
URLSession.shared.fetchData(at: url){ result in
    
}
*/
