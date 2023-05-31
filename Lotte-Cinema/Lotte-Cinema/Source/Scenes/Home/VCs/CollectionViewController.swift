import UIKit
import Then
import SnapKit

class CollectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
}


import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    var homeData: [HomeDataModel] = []
    var homeImageData: [UIImage] = [ImageLiterals.imgGog, ImageLiterals.imgGog, ImageLiterals.imgGog]
    var imageData: [UIImage] = [ImageLiterals.section_1, ImageLiterals.section_2]

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getHomeData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setConfig()
    }

    private func getHomeData() {
        GetService.shared.getService(from: Constants.baseURL + "/main",
                                     isTokenUse: false) {
            (data: [HomeDataModel]?, error) in
            guard let data = data else {
                print("error: \(error?.debugDescription)")
                return
            }
            self.homeData = data
            self.collectionView.reloadData()
        }
    }

    private func setLayout() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubviews(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        scrollView.addSubviews(firstImageView, collectionView, secondImageView)
        firstImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.height.equalTo(349)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.firstImageView.snp.bottom) // cp4 바로 위의꺼로
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.height.equalTo(230)
        }
        secondImageView.snp.makeConstraints {
            $0.top.equalTo(self.collectionView.snp.bottom)
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.height.equalTo(1938)
            $0.bottom.equalToSuperview()
        }
    }

    private func setConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(HomeMovieCVC.self,
                                     forCellWithReuseIdentifier: HomeMovieCVC.identifier)
        var layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 0)
        layout.itemSize = .init(width: 129, height: 275)
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    private let firstImageView = UIImageView(image: ImageLiterals.section_1)
    private let secondImageView = UIImageView(image: ImageLiterals.section_2)
    private let scrollView = UIScrollView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.contentInsetAdjustmentBehavior = .never
    }
}

extension ViewController: UICollectionViewDelegate {}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMovieCVC.identifier, for: indexPath) as? HomeMovieCVC else {return UICollectionViewCell()}
        cell.bindText(title: homeData[indexPath.row].movieName,
                      ratio: homeData[indexPath.row].reservationRatio,
                      scoreOfStar: homeData[indexPath.row].scoreOfStar,
                      image: self.homeImageData[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieInfoVC()
        vc.movieID = homeData[indexPath.row].movieID
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

