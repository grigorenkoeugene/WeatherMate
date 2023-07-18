import UIKit

class WeatherCollectionView: UICollectionView {
    private var collectionViewFlowLayout: UICollectionViewFlowLayout {
            return collectionViewLayout as! UICollectionViewFlowLayout
        }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var weatherCollectionViewModel: WeatherCollectionViewModel?

        func configure(with viewModel: WeatherCollectionViewModel) {
            weatherCollectionViewModel = viewModel
        }
    
}

private extension WeatherCollectionView {
    func initialize() {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        layout.scrollDirection = .horizontal
        self.backgroundColor = UIColor(hexString: "#F2F2F2")
        self.delegate = self
        self.dataSource = self
        collectionViewLayout.collectionView?.showsHorizontalScrollIndicator = false
        let nib = UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "cell")
        configureCollectionViewLayoutItemSize()
        isScrollEnabled = true
    }
    func calculateSectionInset() -> CGFloat {
           return 16
       }
    func configureCollectionViewLayoutItemSize() {
        let inset: CGFloat = calculateSectionInset()
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}

extension WeatherCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let forecast = weatherCollectionViewModel?.weatherData?.forecast else {
            return cell
        }
        let currentDate = Date()
        let calendar = Calendar.current
        let previousHour = calendar.date(byAdding: .hour, value: -1, to: currentDate)!

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        var forecastHours: [Hour] = []
        let maxHoursAhead = 10
            
        for forecastDay in forecast.forecastday {
            for forecastHour in forecastDay.hour {
                if let forecastDate = dateFormatter.date(from: forecastHour.time), forecastDate >= previousHour {
                    forecastHours.append(forecastHour)
                    if forecastHours.count >= maxHoursAhead {
                        let date = dateFormatter.date(from: forecastHours[indexPath.row].time)!
                        dateFormatter.dateFormat = "HH:mm"
                        let timeString = dateFormatter.string(from: date)
                        if indexPath.row == 0 {
                            cell.timeWeatherLabel.text = "Сейчас"
                            
                        } else {
                            cell.timeWeatherLabel.text = timeString
                        }
                        cell.temprichaLabel.text = "\(Int(forecastHours[indexPath.row].tempC.rounded()))°C"
                        return cell
                    }
                }
            }
        }
        

        return cell
    }
}

extension WeatherCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 74, height: 125)
        }

}


