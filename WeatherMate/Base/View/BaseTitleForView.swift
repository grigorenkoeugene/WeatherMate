//
//  TitleForView.swift
//  WeatherMate
//
//  Created by admin on 08.06.2023.
//

import SnapKit
import UIKit

class BaseTitleForView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(21)
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(imageName: UIImage, labelText: String) {
        super.init(frame: .zero)
        
        image.image = imageName
        label.text = labelText
        
        addSubview(image)
        addSubview(label)
        
        let stackView = UIStackView(arrangedSubviews: [image, label])
        stackView.spacing = 8
        stackView.alignment = .center
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



