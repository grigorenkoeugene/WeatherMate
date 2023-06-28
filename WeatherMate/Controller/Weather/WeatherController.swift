import SnapKit
import UIKit

class WeatherController: BaseController, UIScrollViewDelegate {

    var subViewWeather = WeatherInfoView()
    var weatherCollectionView = WeatherCollectionView()
    var weatherChartView = WeatherChartView()
    var lightDayView = BaseLightDayView()
    var constellationsTableView = BaseConstellationsTableView()
    var scrollView = UIScrollView()
    let weatherViewModel = WeatherViewModel()
    let weatherAllDataViewModel = WeatherAllDataViewModel()
    let weatherCollectionViewModel = WeatherCollectionViewModel()
    let weatherInfoView = WeatherInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Минск"
        view.addSubview(scrollView)
        DispatchQueue.main.async {
            self.weatherAllDataViewModel.fetchWeatherData { error in
                if let error = error {
                    print("Ошибка получения данных: \(error.localizedDescription)")
                } else {
                    let weatherDetails = self.weatherAllDataViewModel.getWeatherDetails()
                    self.weatherCollectionViewModel.setWeatherData(weatherDetails)
                    self.weatherViewModel.setWeatherData(weatherDetails)
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.subViewWeather.configur(with: self.weatherViewModel)
                        self.weatherCollectionView.configure(with: self.weatherCollectionViewModel)
                        self.weatherCollectionView.reloadData()
                        print("123", weatherDetails.first?.pop)
                        self.weatherChartView.configure(with: [.init(value: Int(weatherDetails.first?.pop ?? 100), title: "Сейчас", percent: "100%"),
                                                               .init(value: 25, title: "15:55", percent: "25%"),
                                                               .init(value: 75, title: "16:55", percent: "75%"),
                                                               .init(value: 10, title: "17:55", percent: "10%")],
                                                        topChartOffset: 4)

                    }
                }
            }
        }
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.addSubview(contenView)
        contenView.addSubview(subViewWeather)
        contenView.addSubview(weatherCollectionView)
        contenView.addSubview(weatherChartView)
        contenView.addSubview(lightDayView)
        contenView.addSubview(constellationsTableView)
    }
    
    @objc func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
            StatusBar().setStatusBar(for: self, with: Resource.Color.weatherInfoViewBackground, style: .darkContent)
        } else {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            StatusBar().setStatusBar(for: self, with: Resource.Color.weatherInfoViewBackground, style: .lightContent)
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        weatherCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.equalTo(subViewWeather.snp.bottom).offset(24)
            make.height.equalTo(125)
        }
    }
    
    private func setupWeatherGraphicRaineView() {
        weatherChartView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(0)
            make.top.equalTo(weatherCollectionView.snp.bottom).offset(24)
            make.height.equalTo(300)
        }
    }
    
    private func setupLightDayView() {
        lightDayView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(0)
            make.top.equalTo(weatherChartView.snp.bottom).offset(8)
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
        let tabBarHeight = tabBarController?.tabBar.frame.height ?? 0

        let allHeight = constellationsTableView.frame.maxY + tabBarHeight + 1000
        return CGSize(width: view.frame.width, height: allHeight)
    }
    

    private lazy var contenView: UIView = {
        let contenView = UIView()
        contenView.backgroundColor = UIColor(hexString: "#F2F2F2")
        contenView.frame.size = contentSize
        return contenView
    }()
}
