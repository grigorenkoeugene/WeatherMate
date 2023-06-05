//
//  UITableViewDelegate.swift
//  WeatherMate
//
//  Created by admin on 01.06.2023.
//

import UIKit

extension UITableViewDelegate {
    func addSeparator(to cell: UITableViewCell, at indexPath: IndexPath) {
        if indexPath.row != 0 {
            let separator = UIView(frame: CGRect(x: 33, y: 0, width: cell.bounds.width - 66, height: 1))
            separator.backgroundColor = #colorLiteral(red: 0.9600329995, green: 0.964823544, blue: 0.9690905213, alpha: 1)
            cell.addSubview(separator)
        }
    }
}
