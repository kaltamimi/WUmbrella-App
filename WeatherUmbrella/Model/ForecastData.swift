//
//  ForecastData.swift
//  WeatherUmbrella
//
//  Created by Kawthar Khalid al-Tamimi on 08/12/2020.
//

import Foundation


// MARK: - ForecastData
struct ForecastData: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
}


// MARK: - List
struct List: Codable {

    let weather: [WeatherData]
    
    enum CodingKeys: String, CodingKey {
        case weather
    }
}
