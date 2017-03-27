//
//  Weather.swift
//  SimplyWeather
//
//  Created by Bhat, Nanda on 3/26/17.
//  Copyright © 2017 Bhat, Nanda. All rights reserved.
//

import Foundation

struct Coord {
    var lon: String
    var lat: String
}

struct WeatherParam {
    var id: String
    var main: String
    var description: String
    var icon: String
}

struct Main {
    var temp: String?
    var pressure: String
    var humidity: String
    var temp_min: String
    var temp_max: String
    var sea_level: String
    var grnd_level: String
}

struct Wind {
    var speed: String
    var deg: String
}

struct Rain {
    var h3: String
}

struct Clouds {
    var all: String
}

struct Snow {
    var h3: String
}

struct Sys {
    var type: String
    var id: String
    var message: String
    var country: String
    var sunrise: String
    var sunset: String
}

class Weather{
   
    var city: String = ""
    var coord: Coord = Coord(lon: "0", lat: "0")
    //var weatherParam: [WeatherParam]
    //var base: String
    var main: Main = Main(temp: "0", pressure: "0", humidity: "0", temp_min: "0", temp_max: "0", sea_level: "0", grnd_level: "0")
    //var visibility: String
    //var wind: Wind
    //var clouds: Clouds
    //var dt: String
    //var sys: Sys
    //var id: String
    var name: String = ""
    //var cod: String
    //var snow: Snow
    //var rain: Rain
    
    init () {
        
    }
    func setFromJson(json: Any) {
        
        var jlat = ""
        var jlon = ""
        var jtemp = ""
        var jpressure = ""
        var jhumidity = ""
        var jtemp_min = ""
        var jtemp_max = ""
        var jdesc = ""
        
        if let dictionary = json as? [String: Any] {
            for (key, value) in dictionary {
                print ("DICT:")
                print ("KEY:", key)
                print ("VAL:", value)
                
              
                
                if let city = dictionary["name"] as? String {
                    self.city = city
                }
                
                
                if let main = dictionary["main"] as? [String: Any]{
                    print (main)
                    for (key, value) in main {
                        print("\(key) -> \(value)")
                        if key == "temp" {
                            jtemp = "\(main["temp"]!)"
                            print ("temp parsed")
                            print (jtemp)
                        }
                        if key == "pressure" {
                            jpressure = "\(main["pressure"])"
                        }
                        if key == "humidity" {
                            jhumidity = "\(main["humidity"])"
                        }
                        if key == "temp_min" {
                            jtemp_min = "\(main["temp_min"])"
                        }
                        if key == "temp_max" {
                            jtemp_max = "\(main["temp_max"])"
                        }
                    }
                    self.main = Main(temp: jtemp, pressure: jpressure, humidity: jhumidity, temp_min: jtemp_min, temp_max: jtemp_max, sea_level: "", grnd_level: "")
                }
                
            }
        }
        print("From Model")
        print (self.main.temp)
        print (self.city)
    }
            
}

