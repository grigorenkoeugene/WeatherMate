//
//  BaseView.swift
//  WeatherMate
//
//  Created by admin on 01.06.2023.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        constaintViews()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        constaintViews()
        configureAppearance()
    }
}

@objc extension BaseView {
    func setupViews() {}
    func constaintViews() {}
    
    func configureAppearance() {
        backgroundColor = .white
    }

}
