import UIKit

class WeatherColectionView: UICollectionView {
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
}

private extension WeatherColectionView {
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
    }
    func calculateSectionInset() -> CGFloat {
           return 16
       }
    func configureCollectionViewLayoutItemSize() {
        let inset: CGFloat = calculateSectionInset()
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}

extension WeatherColectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }

        return cell
    }
}

extension WeatherColectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 74, height: 125)
        }

}


