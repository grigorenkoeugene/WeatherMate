//
//  MeasurementTableViewCell.swift
//  WeatherMate
//
//  Created by admin on 14.06.2023.
//

import SnapKit
import UIKit

class MeasurementTableViewCell: UITableViewCell {

    @IBOutlet weak var measurementsLabel: UILabel!
    private let сustomSwitch = CustomSwitch()

    var leftLabelText: String = "" {
        didSet {
            сustomSwitch.leftText = leftLabelText
        }
    }
    
    var rightLabelText: String = "" {
        didSet {
            сustomSwitch.rightText = rightLabelText
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        сustomSwitch.isOn = false
        сustomSwitch.leftText = "\u{00B0}С"
        сustomSwitch.rightText = "\u{00B0}F"
        сustomSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        contentView.addSubview(сustomSwitch)
        setupSwitch()
    }
    
    @objc private func switchValueChanged(_ sender: CustomSwitch) {
        if sender == сustomSwitch {
            if sender.isOn {
                print("Switch 1 is turned on")
            } else {
                print("Switch 1 is turned off")
            }
        }
    }
    
    func setupSwitch() {
        сustomSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
            make.width.equalTo(150)
        }
    }
}
