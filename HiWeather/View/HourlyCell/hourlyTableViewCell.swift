//
//  hourlyTableViewCell.swift
//  HiWeather
//
//  Created by Corder Collie on 2022/05/14.
//

import UIKit

class hourlyTableViewCell: UITableViewCell {

    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.backgroundColor = .clear
        
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
        hourlyCollectionView.register(UINib(nibName: Constants.hourlyCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.hourlyCollectionViewCellIdentifier)
        hourlyCollectionView.reloadData()
        hourlyCollectionView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension hourlyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.hourlyCollectionViewCellIdentifier, for: indexPath) as! hourlyCollectionViewCell
        return cell
    }
}

extension hourlyTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5 - 10
        let size = CGSize(width: width, height: 110)

        return size
    }
}
