//
//  ViewController.swift
//  weatherapp
//
//  Created by Muhammed Yusuf Kaynak on 7.08.2022.
//

import UIKit

class ViewController: UIViewController {
    private var weatherViewModel : WeatherViewModel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        callToViewModelForUIUpdate()
       
    }
    
    func callToViewModelForUIUpdate() {
        self.weatherViewModel = WeatherViewModel()
    }
}




