//
//  WeatherModel.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/15.
//

import Foundation

struct WeatherModel {
    //City Name, City Time Zone
    var cityName: String?
    var time: Double?
    
    //Current Weather
    var current: CurrentWeatherModel?
    
    //Hourly Weather
    var hourly: [HourlyWeatherModel]?
    
}

struct CurrentWeatherModel {
    var dt: Double?
    var temp: Double?
    var humidity: Int?
    
    var id: Int?
    var main: String?
    var description: String?
}

struct HourlyWeatherModel {
    var dt: Double?
    var krTime: Int? {
        let krDate: DateFormatter = {
            let df = DateFormatter()
            df.locale = Locale(identifier: "ko_KR")
            df.timeZone = TimeZone(abbreviation: "KST")
            df.dateFormat = "HH"
            return df
        }()
        return Int(krDate.string(from: Date(timeIntervalSince1970: dt ?? 0.0))) ?? 0
    }
    var temp: Double?
    var humidity: Int?
    
    var id: Int?
    var main: String?
    var description: String?
}



//받아온 UTC Time을 그냥 시간으로 바꾸는 함수 작성할 것.
//let date2 = Date(timeIntervalSince1970: dt_1)
//print(dt_1)
//print(date2)
//let testDate: DateFormatter = {
//    let df = DateFormatter()
//    df.locale = Locale(identifier: "ko_KR")
//    df.timeZone = TimeZone(abbreviation: "KST")
//    df.dateFormat = "HH" // 시간만 나오게 설정.
//    return df
//}()
//print(testDate.string(from: date2))
