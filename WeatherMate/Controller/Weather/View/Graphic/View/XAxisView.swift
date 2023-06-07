//
//  XAxisView.swift
//  WeatherMate
//
//  Created by admin on 02.06.2023.
//

import UIKit

final class XAxisView: BaseView {

    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    private let percentStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WMChartsView.Data]) {
        timeStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        percentStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        data.forEach {
            let timeLabel = UILabel()
            timeLabel.font = timeLabel.font.withSize(16)
            timeLabel.textColor = Resource.Color.thirdColor
            timeLabel.textAlignment = .center
            timeLabel.text = $0.title
            timeStackView.addArrangedSubview(timeLabel)

            let percentLabel = UILabel()
            percentLabel.font = percentLabel.font.withSize(16)
            percentLabel.textColor = Resource.Color.active
            percentLabel.textAlignment = .center
            percentLabel.text = $0.percent
            percentStackView.addArrangedSubview(percentLabel)
        }
        stackView.addArrangedSubview(timeStackView)
        stackView.addArrangedSubview(percentStackView)
    }

}

extension XAxisView {
    override func setupViews() {
        super.setupViews()

        setupView(stackView)
        
    }

    override func constaintViews() {
        super.constaintViews()

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
}


