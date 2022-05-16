//
//  WeatherManager.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/15.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/onecall?exclude=minutely,daily&appid=846e3607ee7f0f4c54312057e62c7165&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(lat: Float, lon: Float) {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the Session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        print(weather)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decorder = JSONDecoder()
        do {
            let decodeData = try decorder.decode(WeatherData.self, from: weatherData)
            //City Name, City Time
            let name = decodeData.timezone
            let time = decodeData.timezone_offset
           
            //Current Weather Data
            let current = decodeData.current
            
            let dt = current.dt
            let temp = current.temp
            let humidity = current.humidity
            let id = current.weather[0].id
            let main = current.weather[0].main
            let description = current.weather[0].description
            print(current)
            
            let weather = WeatherModel(cityName: name, time: time)
            
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
