//
//  WeatherData.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/15.
//

import Foundation

struct WeatherData: Codable {
    let timezone: String
    let timezone_offset: Int
    let current: CurrentWeatherData
}

struct CurrentWeatherData: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let weather: [Weather]
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}
