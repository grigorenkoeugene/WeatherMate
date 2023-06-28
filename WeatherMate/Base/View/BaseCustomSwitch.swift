//
//  BaseCustomSwitch.swift
//  WeatherMate
//
//  Created by admin on 19.06.2023.
//

import UIKit

class CustomSwitch: UIControl {
    private let thumbView = UIView()
        private let leftLabel = UILabel()
        private let rightLabel = UILabel()
        
        var isOn = false {
            didSet {
                updateUI()
            }
        }
        
        var leftText: String = "" {
            didSet {
                leftLabel.text = leftText
            }
        }
        
        var rightText: String = "" {
            didSet {
                rightLabel.text = rightText
            }
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupGestures()
        updateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupGestures()
        updateUI()
    }
    
    private func setupViews() {
        backgroundColor = UIColor(hexString: "#E2E8ED")
        clipsToBounds = true
        addSubview(rightLabel)
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        thumbView.frame = CGRect(x: 0, y: 0, width: bounds.width / 2, height: bounds.height)
        addSubview(thumbView)
        
        addSubview(leftLabel)
            leftLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.top.bottom.equalToSuperview()
                make.trailing.equalTo(snp.centerX).offset(-1)
            }
            leftLabel.textAlignment = .center
            
            addSubview(rightLabel)
            rightLabel.snp.makeConstraints { make in
                make.leading.equalTo(snp.centerX).offset(10)
                make.top.bottom.equalToSuperview()
                make.trailing.equalToSuperview().inset(16)
            }
            rightLabel.textAlignment = .center
        
        bringSubviewToFront(rightLabel)

        layer.cornerRadius = 8
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        animateThumbView()
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        if let touch = touch, bounds.contains(touch.location(in: self)) {
            isOn.toggle()
            sendActions(for: .valueChanged)
        }
        
        animateThumbView()
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        isOn.toggle()
        sendActions(for: .valueChanged)
        animateThumbView()
    }
    
    private func animateThumbView() {
            let thumbViewWidth = bounds.width / 2
            let thumbViewPosition = isOn ? bounds.width - thumbViewWidth : 0
            
            UIView.animate(withDuration: 0.1) {
                self.thumbView.frame.origin.x = thumbViewPosition
            }
        }
    
    private func updateUI() {
        let activeColor = UIColor.white
        let thumbViewColor = Resource.Color.active
        
        leftLabel.textColor = isOn ? Resource.Color.timeSunriseSunset : activeColor
        rightLabel.textColor = isOn ? activeColor : Resource.Color.timeSunriseSunset
        thumbView.backgroundColor = thumbViewColor
    }
}
