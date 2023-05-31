import SnapKit
import UIKit

class WeatherView: UIViewController {

    var subViewWeather = WeatherSubView()
    var weatherColectionView = WeatherColectionView()
    var weatherGraphicRaineView = WeatherGraphicRaineView()
    var scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        setupNavigationBar()
        view.addSubview(scrollView)
        scrollView.addSubview(contenView)
        contenView.addSubview(subViewWeather)
        contenView.addSubview(weatherColectionView)
        contenView.addSubview(weatherGraphicRaineView)

        let info = WeatherModel(date: "123", tempricha: 21, speedWind: 123, pressure: 123)
        subViewWeather.configur(with: info)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupScrollView()
        self.setupWeatherSubView()
        self.setupWeatherColectionView()
        self.setupWeatherGraphicRaineView()
    }

    private func setupWeatherSubView() {
        subViewWeather.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(0)
            make.height.equalTo(350)
        }
    }
    private func setupWeatherColectionView() {
        weatherColectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.equalTo(subViewWeather.snp.bottom).offset(24)
            make.height.equalTo(125)
        }
    }
    
    private func setupWeatherGraphicRaineView() {
        weatherGraphicRaineView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(0)
            make.top.equalTo(weatherColectionView.snp.bottom).offset(24)
            make.height.equalTo(400)
        }
    }
    
    private func setupScrollView() {
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
    }
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
    private lazy var contenView: UIView = {
        let contenView = UIView()
        contenView.backgroundColor = UIColor(hexString: "#F2F2F2")
        contenView.frame.size = contentSize
        return contenView
    }()
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "Минск" // Добавить название для местоположения

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}


