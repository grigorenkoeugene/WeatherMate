//
//  AboutAppView.swift
//  WeatherMate
//
//  Created by admin on 19.06.2023.
//

import SnapKit
import UIKit

class AboutAppView: BaseView {
    private let aboutAppLabel = UILabel(font: 16, textColor: Resource.Color.timeSunriseSunset)
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        return imageView
    }()
}

extension AboutAppView {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        layer.cornerRadius = 24
        aboutAppLabel.text = "О приложении"
        addSubview(aboutAppLabel)
    }
    override func constaintViews() {
        let stackView = UIStackView()
        addSubview(stackView)
        stackView.addArrangedSubview(aboutAppLabel)
        stackView.addArrangedSubview(arrowImage)
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(22)
            make.top.bottom.equalToSuperview().inset(14)
        }
    }
    
}
