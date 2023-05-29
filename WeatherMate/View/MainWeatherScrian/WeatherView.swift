import SnapKit
import UIKit

class WeatherView: UIViewController {

    let subViewWeather = WeatherSubView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(subViewWeather)
        setupNavigationBar()
        let info = WeatherModel(date: "123", tempricha: 21, speedWind: 123, pressure: 123)
        subViewWeather.configur(with: info)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupWeatherSubView()

    }

    private func setupWeatherSubView() {
        subViewWeather.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(0)
            make.height.equalTo(350)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "Минск" // Добавить название для местоположения
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}


