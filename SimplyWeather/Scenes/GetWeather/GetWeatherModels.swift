//
//  GetWeatherModels.swift
//  SimplyWeather
//
//  Created by Bhat, Nanda on 3/26/17.
//  Copyright (c) 2017 Bhat, Nanda. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct GetWeather
{
    struct Location
    {
        struct Request
        {
            var latitude: String
            var longitude: String
            var isFarenheit: Bool
        }
        struct Response
        {
            var city: String
            var temperature: String
            var isFarenheit: Bool
        }
        struct ViewModel
        {
            var city: String
            var temperature: String
        }
    }
    
}