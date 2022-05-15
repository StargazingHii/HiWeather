//
//  SearchCell.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/03.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectButton(_ sender: UIButton) {
        textField.text = "Hi"
    }
}
