//
//  ViewController.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/03/22.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weatherManager = WeatherManager()
    var weatherModel = WeatherModel() // 여기에 받아온 데이터를 저장해서 tableViewCell에 적용해주자.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self //순서 주의할 것 delegate 를 먼저 선언해줘야한다. !!!!!
        weatherManager.fetchWeather(lat: 37.57, lon: 126.98)
        
        setUpTableView()
        
    }
    
    func setUpTableView() {
        self.tableView.backgroundColor = UIColor(named: "blueBackground")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Cell Register
        tableView.register(UINib(nibName: Constants.searchCellNibName, bundle: nil), forCellReuseIdentifier: Constants.searchCellIdentifier)
        tableView.register(UINib(nibName: Constants.currentCellNibName, bundle: nil), forCellReuseIdentifier: Constants.currentCellIdentifier)
        tableView.register(UINib(nibName: Constants.hourlyTableViewCellNibName, bundle: nil), forCellReuseIdentifier: Constants.hourlyTableViewCellIdentifier)
        
    }
}

//MARK: - UITableViewDataSource
extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Section
    //Section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    //Section마다 표현될 헤더
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    }
    //Section마다 표현될 풋
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//    }

    //MARK: - Row Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        else if section == 2 {
            return 1
        }
        else if section == 3 {
            return 0
        }
        return 1 // default
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.searchCellIdentifier, for: indexPath) as! SearchCell
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.currentCellIdentifier, for: indexPath) as! currentWeatherCell
            cell.cityNameLabel.text = weatherModel.cityName
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.hourlyTableViewCellIdentifier, for: indexPath) as! hourlyTableViewCell
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 1 {
            return 500
        } else if indexPath.section == 2 && indexPath.row == 0 {
            return 200
        }
        return CGFloat()
    }
}

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        self.weatherModel = weather
        
        print(weatherModel.hourly![0].dt!) //test 확인 완료
        print(weatherModel.hourly![0].krTime!) // test 확인 완료
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
