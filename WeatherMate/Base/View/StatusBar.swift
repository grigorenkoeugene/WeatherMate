//
//  StatusBar.swift
//  WeatherMate
//
//  Created by admin on 12.06.2023.
//

import UIKit

class StatusBar {
    func setStatusBar(for controller: UIViewController, with color: UIColor, style: UIStatusBarStyle) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let statusBarFrame = windowScene.statusBarManager?.statusBarFrame {
                let statusBarView = UIView(frame: statusBarFrame)
                statusBarView.backgroundColor = color 
                controller.view.addSubview(statusBarView)
            }
            
            UIApplication.shared.statusBarStyle = style
        }
    }
    

}
