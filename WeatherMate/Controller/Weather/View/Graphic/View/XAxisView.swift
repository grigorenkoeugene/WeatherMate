//
//  XAxisView.swift
//  WeatherMate
//
//  Created by admin on 02.06.2023.
//

import UIKit

final class XAxisView: BaseView {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()

    func configure(with data: [WMChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        data.forEach {
            let label = UILabel()
//            lable.font = R.Fonts.helvelticaRegular(with: 9)
//            lable.textColor = R.Colors.inactive
            label.font = label.font.withSize(16)
            label.textColor = Resource.Color.thirdColor
            label.textAlignment = .center
            label.text = $0.title

            stackView.addArrangedSubview(label)
        }
    }
}

extension XAxisView {
    override func setupViews() {
        super.setupViews()

        setupView(stackView)
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
}


