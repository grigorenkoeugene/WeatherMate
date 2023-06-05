//
//  ConstellationsTableViewCell.swift
//  WeatherMate
//
//  Created by admin on 01.06.2023.
//

import UIKit

class ConstellationsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.textColor = Resource.Color.timeSunriseSunset
        time.textColor = Resource.Color.timeSunriseSunset

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
