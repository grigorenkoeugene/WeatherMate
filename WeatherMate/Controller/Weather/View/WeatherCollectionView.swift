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
        6
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let weatherDetails = weatherCollectionViewModel?.weatherData[indexPath.item]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Формат времени в weatherDetails?.dtTxt

        if let dtTxt = weatherDetails?.dtTxt,
           let date = dateFormatter.date(from: dtTxt) {
            dateFormatter.dateFormat = "HH:mm" // Желаемый формат времени (часы:минуты)
            let timeString = dateFormatter.string(from: date)
            if indexPath.row == 0 {
                cell.timeWeatherLabel.text = "Сейчас"
                
            } else {
                cell.timeWeatherLabel.text = timeString
            }
        } else {
            cell.timeWeatherLabel.text = ""
        }
        if let temperature = weatherDetails?.main.temp {
            let temperatureString = String(format: "%.0f", temperature - 273)
            cell.temprichaLabel.text = "\(temperatureString)\u{00B0}С"
        } else {
            cell.temprichaLabel.text = ""
        }
        return cell
    }
}

extension WeatherCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 74, height: 125)
        }

}


