//
//  YAxisView.swift
//  WeatherMate
//
//  Created by admin on 02.06.2023.
//

import SnapKit
import UIKit

final class YAxisView: BaseView {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing

        return view
    }()

    func configure(with data: [WMChartsView.Data]) {
        
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (1...4).reversed().forEach {
            let label = UILabel()
            label.font = label.font.withSize(12)
            label.textColor = Resource.Color.thirdColor
            label.textAlignment = .right
            label.text = "\($0 * 25)%"

            stackView.addArrangedSubview(label)
        }
    }

}

extension YAxisView {
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
