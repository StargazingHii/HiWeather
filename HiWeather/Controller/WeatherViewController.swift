//
//  ViewController.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/03/22.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = UIColor(named: "blueBackground")
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
