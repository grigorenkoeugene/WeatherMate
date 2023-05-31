//
//  TabBarController .swift
//  WeatherMate
//
//  Created by admin on 31.05.2023.
//

import UIKit


class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "cell", bundle: nibBundleOrNil)
        configur()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func configur() {
        let testTabBar = WeatherView()
        
        let testNavigaton = UINavigationController(rootViewController: testTabBar)
        
        testNavigaton.tabBarItem = UITabBarItem(title: Resource.Strings.TabBar.weather, image: Resource.Images.weather, tag: 1)
        
        setViewControllers([testTabBar], animated: false)
    }
}
