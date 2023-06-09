//
//  WeatherTableViewCell.swift
//  WeatherMate
//
//  Created by admin on 08.06.2023.
//

import SnapKit
import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayType: UILabel!
    @IBOutlet weak var weatherTypeImage: UIImageView!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var lowTempricha: UILabel!
    @IBOutlet weak var highTempricha: UILabel!
    
    //    var dayType = UILabel(font: 19)
//
//    var weatherTypeImage: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "cloud")
//        imageView.image = image
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    var percent = UILabel(font: 19)
//    var lowTempricha = UILabel(font: 19)
//    var highTempricha = UILabel(font: 19)


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

