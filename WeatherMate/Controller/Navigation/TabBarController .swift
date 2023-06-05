//
//  TabBarController .swift
//  WeatherMate
//
//  Created by admin on 31.05.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar() {
        tabBar.tintColor = Resource.Color.active
        tabBar.backgroundColor = .white
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.cornerRadius = 8
        let weatherController = WeatherController()
        let timeController = DateController()
        let mapController = UIViewController()
        let settingController = SettingController()

        let weatherNavigaton = NavBarController(rootViewController: weatherController)
        let timeNavigaton = NavBarController(rootViewController: timeController)
        let mapNavigaton = NavBarController(rootViewController: mapController)
        let settingNavigaton = NavBarController(rootViewController: settingController)

        let weatherTabBarItem = UITabBarItem(title: Resource.Strings.TabBar.weather,
                                             image: Resource.Images.weatherInactive,
                                             selectedImage: Resource.Images.weatherActive)
        let timeTabBarItem = UITabBarItem(title: Resource.Strings.TabBar.time,
                                          image: Resource.Images.timeInactive,
                                          selectedImage: Resource.Images.timeActive)
        let mapTabBarItem = UITabBarItem(title: Resource.Strings.TabBar.map,
                                         image: Resource.Images.mapInactive,
                                         selectedImage: Resource.Images.mapActive)
        let settingTabBarItem = UITabBarItem(title: Resource.Strings.TabBar.setting,
                                             image: Resource.Images.settingInactive,
                                             selectedImage: Resource.Images.settingActive)

        weatherNavigaton.tabBarItem = weatherTabBarItem
        timeNavigaton.tabBarItem = timeTabBarItem
        mapNavigaton.tabBarItem = mapTabBarItem
        settingNavigaton.tabBarItem = settingTabBarItem
        
        setViewControllers([
            weatherNavigaton,
            timeNavigaton,
            mapNavigaton,
            settingNavigaton],
           animated: false)
    }
}



