//
//  WeatherGraphicRaineView.swift
//  WeatherMate
//
//  Created by admin on 30.05.2023.
//

import SnapKit
import UIKit

class WeatherGraphicRaineView: UIView {
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var precipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "Вероятность осадков"
        label.font = label.font.withSize(21)
        return label
    }()
    
    private var dropImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "dropView")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
}

private extension WeatherGraphicRaineView {
    func initialize() {
        backgroundColor = .white
        layer.cornerRadius = 24
        setupStackViewType()
    }
    
    func setupStackViewType() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(dropImage)
        stackView.addArrangedSubview(precipitationLabel)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
    }
    
}
