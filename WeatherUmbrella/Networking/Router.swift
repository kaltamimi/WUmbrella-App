//
//  Router.swift
//  WeatherUmbrella
//
//  Created by Kawthar Khalid al-Tamimi on 09/12/2020.
//

import Foundation


enum Router {
    
    case getCityWeather(cityName: String)
    case getLocationWeather(latitude: String, longitude: String)
    case getForecast(cityName: String)
    case getLocationForecast(latitude: String, longitude: String)
    
    var scheme: String {
        switch self {
        case .getCityWeather , .getLocationWeather , .getForecast, .getLocationForecast:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getCityWeather , .getLocationWeather , .getForecast, .getLocationForecast:
            return "api.openweathermap.org"
        }
    }
    
    var path: String {
        switch self {
        case .getCityWeather, .getLocationWeather:
            return "/data/2.5/weather"
        case .getForecast, .getLocationForecast:
            return "/data/2.5/forecast"
        }
    }
    
    /*
     INSERT YOUR API KEY HERE
     REGISTER api.openweathermap.org TO GET YOUR KEY!!!
     */
    var parameters: [URLQueryItem] {
        switch self {
        case .getCityWeather(let cityName):
            return [
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "appid", value: Secret.API_KEY),
                URLQueryItem(name: "q", value: cityName)]
            
        case .getLocationWeather(let latitude, let longitude):
            return [
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "appid", value: Secret.API_KEY),
                URLQueryItem(name: "lat", value: latitude),
                URLQueryItem(name: "lon", value: longitude)]
            
        case .getForecast(let cityName):
            return [URLQueryItem(name: "units", value: "metric"),
                    URLQueryItem(name: "appid", value: Secret.API_KEY),
                    URLQueryItem(name: "q", value: cityName)]
            
        case .getLocationForecast(let latitude, let longitude):
            return [
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "appid", value: Secret.API_KEY),
                URLQueryItem(name: "lat", value: latitude),
                URLQueryItem(name: "lon", value: longitude)]
            
        }
    }
    
}
