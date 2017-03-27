//
//  WeatherAPI.swift
//  SimplyWeather
//
//  Created by Bhat, Nanda on 3/26/17.
//  Copyright © 2017 Bhat, Nanda. All rights reserved.
//

import Foundation

class WeatherAPI {
    
    //MARK: private properties
    
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "c28376de72c0f6192761d33f6cc904e0"
    
    private var city: String = ""
    private var temp: String = ""
    var weather: Weather = Weather()
    var isweather = false
    
    private var latitudeRequest = ""
    private var longitudeRequest = ""
    
    //MARK: Initialize instance
    init() {
    
    }
    
    func setLatAndLong(latitude: String, longitude: String) {
        self.latitudeRequest = latitude
        self.longitudeRequest = longitude
    }

    
    //MARK: Methods
    
    func getWeather(didReceive: @escaping (_ city: String?, _ tempp: String?)-> Void) {
        
        //set up shared session
        let session = URLSession.shared
        
        //set up URL
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?lat=\(self.latitudeRequest)&lon=\(self.longitudeRequest)&APPID=\(openWeatherMapAPIKey)")
        
        //data tasks
        
        
        let datatask = session.dataTask(with: weatherRequestURL!) { (data, response, error) in
            if error != nil {
                print("error")
                print(response ?? "nil")
            }
            else {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                //https://developer.apple.com/swift/blog/?id=37
                
                self.weather = Weather()
                self.weather.setFromJson(json: json)
                print ("from API")
                print(self.weather.city)
                print(self.weather.main.temp)
                didReceive(self.weather.city, self.weather.main.temp!)
                
            }
        }
        
        //launch datatask
        datatask.resume()
        print ("returning weather")
        
    }
}

