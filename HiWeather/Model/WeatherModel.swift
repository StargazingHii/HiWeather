//
//  WeatherModel.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/15.
//

import Foundation

struct WeatherModel {
    var cityName: String?
    var time: Int?
    
    var current: CurrentWeatherModel?
//    var dt: Int?
//    var temp: Double?
//    var humidity: Int?
//
//    var id: Int?
//    var main: String?
//    var description: String?
}

struct CurrentWeatherModel {
    var dt: Int?
    var temp: Double?
    var humidity: Int?
    var weather: [Weather]?
}


//받아온 UTC Time을 그냥 시간으로 바꾸는 함수 작성할 것.
