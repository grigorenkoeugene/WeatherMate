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
    let weatherCollectionViewModel = WeatherCollectionViewModel()
    var stackView = UIStackView()
    var timeWeatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Resource.Color.thirdColor
        label.textAlignment = .center
        return label
    }()
    
    var temprichaLabel: UILabel = {
        let label = UILabel(font: 19, textColor: Resource.Color.thirdColor)
        label.textAlignment = .center
        return label
    }()
    
    private var cloudImage = UIImageView(named: "cloud")


    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually

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
