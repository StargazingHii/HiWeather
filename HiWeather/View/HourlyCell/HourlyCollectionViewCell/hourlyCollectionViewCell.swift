//
//  hourlyCollectionViewCell.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/14.
//

import UIKit

class hourlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
