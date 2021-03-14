//
//  WeatherManager.swift
//  WeatherUmbrella
//
//  Created by Kawthar Khalid al-Tamimi on 05/12/2020.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
    
}

class WeatherManager {
    
    var delegate : WeatherManagerDelegate?
    
    func getWeather(cityName: String){
        
        NetworkService.request(router: .getCityWeather(cityName: cityName)) { (result: WeatherData) in
            let id = result.weather[0].id
            let temp = result.main.temp
            let name = result.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            self.delegate?.didUpdateWeather(self, weather: weather)
        }
        
    }
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        
        NetworkService.request(router: Router.getLocationWeather(latitude: "\(latitude)", longitude: "\(longitude)")) { (result: WeatherData ) in
            let id = result.weather[0].id
            let temp = result.main.temp
            let name = result.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            self.delegate?.didUpdateWeather(self, weather: weather)
        }
        
    }
    
    func getForecast(cityName: String){
        
        
        NetworkService.request(router: .getForecast(cityName: cityName)) { (result: [WeatherData]) in
            
            
        }
    }
    
    
    func getForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        
    }
    
}
