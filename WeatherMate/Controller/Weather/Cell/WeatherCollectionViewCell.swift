//
//  WeatherCollectionViewCell.swift
//  WeatherMate
//
//  Created by admin on 29.05.2023.
//

import SnapKit
import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    
    var stackView = UIStackView()
    var timeWeatherLabel: UILabel = {
        let label = UILabel(font: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var temprichaLabel: UILabel = {
        let label = UILabel(font: 19)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private var cloudImage = UIImageView(named: "cloud")


    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        timeWeatherLabel.text = "Сейчас"
        temprichaLabel.text = "-21 \u{00B0}C"
        stackView.addArrangedSubview(timeWeatherLabel)
        stackView.addArrangedSubview(cloudImage)
        stackView.addArrangedSubview(temprichaLabel)
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.bottom.equalToSuperview().inset(0)
        }
        self.layer.cornerRadius = 16
    }
    
    

}

private extension UIImageView {
    convenience init(named: String) {
        self.init()
        self.image = UIImage(named: named)
        self.contentMode = .scaleAspectFit
        
    }
}
