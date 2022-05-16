//
//  currentWeatherCell.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/03.
//

import UIKit

class currentWeatherCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var currentDayOfWeekLabel: UILabel!
    @IBOutlet weak var currentMonthLabel: UILabel!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentMeridiem: UILabel!
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var tempMarkLabel: UILabel!
    
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
    

