import SnapKit
import UIKit

class WeatherController: BaseController {

    var subViewWeather = WeatherInfoView()
    var weatherColectionView = WeatherColectionView()
    var weatherGraphicRaineView = WeatherGraphicRaineView()
    var lightDayView = LightDayView()
    var constellationsTableView = ConstellationsTableView()
    var scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Минск"
        view.addSubview(scrollView)
        scrollView.addSubview(contenView)
        contenView.addSubview(subViewWeather)
        contenView.addSubview(weatherColectionView)
        contenView.addSubview(weatherGraphicRaineView)
        contenView.addSubview(lightDayView)
        contenView.addSubview(constellationsTableView)

        let info = WeatherModel(date: "123", tempricha: 21, speedWind: 123, pressure: 123)
        subViewWeather.configur(with: info)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupScrollView()
        self.setupWeatherSubView()
        self.setupWeatherColectionView()
        self.setupWeatherGraphicRaineView()
        self.setupLightDayView()
        self.setupConstellationsTableView()
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
            make.height.equalTo(300)
        }
    }
    
    private func setupLightDayView() {
        lightDayView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(0)
            make.top.equalTo(weatherGraphicRaineView.snp.bottom).offset(8)
            make.height.equalTo(320)
        }
    }
        
    private func setupConstellationsTableView() {
        constellationsTableView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(0)
            make.top.equalTo(lightDayView.snp.bottom).offset(2)
            make.height.equalTo(210)
        }
    }
    private func setupScrollView() {
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
    }
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 800)
    }
    

    private lazy var contenView: UIView = {
        let contenView = UIView()
        contenView.backgroundColor = UIColor(hexString: "#F2F2F2")
        contenView.frame.size = contentSize
        return contenView
    }()
}


