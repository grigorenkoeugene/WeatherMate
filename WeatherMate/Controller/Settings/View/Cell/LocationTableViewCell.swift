//
//  LocationTableViewCell.swift
//  WeatherMate
//
//  Created by admin on 14.06.2023.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    var addCellButton: UIButton = {
        let addButton = UIButton(type: .custom)
        addButton.setImage(UIImage(named: "plus"), for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        return addButton
    }()
    
    @objc func addButtonTapped(_ sender: UIButton) {
        print("add")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
