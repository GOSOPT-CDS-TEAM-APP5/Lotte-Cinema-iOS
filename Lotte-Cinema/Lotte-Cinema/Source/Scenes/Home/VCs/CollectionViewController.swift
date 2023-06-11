import UIKit
import Then
import SnapKit

class CollectionViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    
    func setStyle() {
        collectionView.do {
            $0.register(MovieChartCVC.self, forCellWithReuseIdentifier: MovieChartCVC.identifier)
            $0.register(EventV.self, forCellWithReuseIdentifier: EventV.identifier) //셀 eventCVC
            //        $0.register(EventCVC.self, forCellWithReuseIdentifier: EventCVC.identifier) //eventDetail
            $0.register(MovieFeedCVC.self, forCellWithReuseIdentifier: MovieFeedCVC.identifier)
            $0.register(HashtagLottecinemaCVC.self, forCellWithReuseIdentifier: HashtagLottecinemaCVC.identifier)
            //$0.register(HomeCollectionViewFooter.self, forCellWithReuseIdentifier: HomeCollectionViewFooter.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.dataSource = self
            $0.delegate = self
            $0.register(HomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.identifier)
            
            $0.register(HomeCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier)
        }
    }
    
    func setLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.trailing.bottom.equalToSuperview()
            
        }
        //flow, compositional
    }
    
    
}




extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        switch indexPath.section {
        case 0 : return CGSize(width: (UIScreen.main.bounds.width) , height: 251)
        case 1 : return CGSize(width: (UIScreen.main.bounds.width) , height: 503)
        case 2 : return CGSize(width: (UIScreen.main.bounds.width) , height: 457)
        case 3 : return CGSize(width: (UIScreen.main.bounds.width) , height: 370)
        case 4 : return CGSize(width: (UIScreen.main.bounds.width) , height: 198)
        case 5 : return CGSize(width: (UIScreen.main.bounds.width) , height: 463)
        case 6 : return CGSize(width: (UIScreen.main.bounds.width) , height: 359)
        default : return .zero
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}

extension CollectionViewController : UICollectionViewDelegate {}
extension CollectionViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let movieChartCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieChartCVC.identifier, for: indexPath) as? MovieChartCVC else{return UICollectionViewCell()}
        guard let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: EventV.identifier, for: indexPath) as? EventV else{return UICollectionViewCell()}
        switch indexPath.section {
        case 1 :
            return movieChartCell
        case 2 :
            return eventCell
        default :
            return UICollectionViewCell()
            
        }
        //cell
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier, for: indexPath) as? HomeCollectionViewHeader else{return UICollectionReusableView()}
        guard let cellHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.identifier, for: indexPath) as? HomeHeaderView else{return UICollectionReusableView()}
        
        switch indexPath.section {
        case 0 :
            return header
        case 1 :
            return cellHeader
        case 2 :
            return cellHeader
        case 3 :
            return cellHeader
        case 4 :
            return cellHeader
            
        default :
            return cellHeader
        }
    }//헤더 푸터
}




//import UIKit
//import SnapKit
//import Then
//
//class ViewController: UIViewController {
//    var homeData: [HomeDataModel] = []
//    var homeImageData: [UIImage] = [ImageLiterals.imgGog, ImageLiterals.imgGog, ImageLiterals.imgGog]
//    var imageData: [UIImage] = [ImageLiterals.section_1, ImageLiterals.section_2]
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.getHomeData()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setLayout()
//        self.setConfig()
//    }
//
//    private func getHomeData() {
//        GetService.shared.getService(from: Constants.baseURL + "/main",
//                                     isTokenUse: false) {
//            (data: [HomeDataModel]?, error) in
//            guard let data = data else {
//                print("error: \(error?.debugDescription)")
//                return
//            }
//            self.homeData = data
//            self.collectionView.reloadData()
//        }
//    }
//
//    private func setLayout() {
//        self.navigationController?.isNavigationBarHidden = true
//        self.view.addSubviews(scrollView)
//        scrollView.snp.makeConstraints {
//            $0.top.bottom.leading.trailing.equalToSuperview()
//        }
//        scrollView.addSubviews(firstImageView, collectionView, secondImageView)
//        firstImageView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.leading.equalTo(self.view.snp.leading)
//            $0.trailing.equalTo(self.view.snp.trailing)
//            $0.height.equalTo(349)
//        }
//        collectionView.snp.makeConstraints {
//            $0.top.equalTo(self.firstImageView.snp.bottom) // cp4 바로위의꺼로
//            $0.leading.equalTo(self.view.snp.leading)
//            $0.trailing.equalTo(self.view.snp.trailing)
//            $0.height.equalTo(230)
//        }
//        secondImageView.snp.makeConstraints {
//            $0.top.equalTo(self.collectionView.snp.bottom)
//            $0.leading.equalTo(self.view.snp.leading)
//            $0.trailing.equalTo(self.view.snp.trailing)
//            $0.height.equalTo(1938)
//            $0.bottom.equalToSuperview()
//        }
//    }
//
//    private func setConfig() {
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
//        self.collectionView.register(HomeMovieCVC.self,
//                                     forCellWithReuseIdentifier: HomeMovieCVC.identifier)
//        var layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 12
//        layout.scrollDirection = .horizontal
//        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 0)
//        layout.itemSize = .init(width: 129, height: 275)
//        self.collectionView.setCollectionViewLayout(layout, animated: false)
//    }
//    private let firstImageView = UIImageView(image: ImageLiterals.section_1)
//    private let secondImageView = UIImageView(image: ImageLiterals.section_2)
//    private let scrollView = UIScrollView()
//    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
//        $0.contentInsetAdjustmentBehavior = .never
//    }
//}
//
//extension ViewController: UICollectionViewDelegate {}
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return homeData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMovieCVC.identifier, for: indexPath) as? HomeMovieCVC else {return UICollectionViewCell()}
//        cell.bindText(title: homeData[indexPath.row].movieName,
//                      ratio: homeData[indexPath.row].reservationRatio,
//                      scoreOfStar: homeData[indexPath.row].scoreOfStar,
//                      image: self.homeImageData[indexPath.row])
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = MovieInfoVC()
//        vc.movieID = homeData[indexPath.row].movieID
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//}
//
