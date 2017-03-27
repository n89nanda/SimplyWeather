//
//  GetWeatherPresenter.swift
//  SimplyWeather
//
//  Created by Bhat, Nanda on 3/26/17.
//  Copyright (c) 2017 Bhat, Nanda. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol GetWeatherPresenterInput
{
    func presentWeather(response: GetWeather.Location.Response)
    
}

protocol GetWeatherPresenterOutput: class
{
  func displayWeather(viewModel: GetWeather.Location.ViewModel)
}

class GetWeatherPresenter: GetWeatherPresenterInput
{
  weak var output: GetWeatherPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentWeather(response: GetWeather.Location.Response)
  {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    print ("in present weather")
    print(response.temperature)
    var convertedTemp = ""
    if response.isFarenheit {
        convertedTemp = "\(Measurement(value: Double(response.temperature)! , unit: UnitTemperature.kelvin).converted(to: UnitTemperature.fahrenheit).value)"
    }
    else {
        convertedTemp = "\(Measurement(value: Double(response.temperature)!, unit: UnitTemperature.kelvin).converted(to: UnitTemperature.celsius).value)"
    }
    print("converted temp: ")
    print(convertedTemp)
    let viewModel = GetWeather.Location.ViewModel(city: response.city, temperature:convertedTemp)
    output.displayWeather(viewModel: viewModel)
  }
    
}