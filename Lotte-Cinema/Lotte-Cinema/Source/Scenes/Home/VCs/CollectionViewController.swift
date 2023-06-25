import UIKit
import Then
import SnapKit

class CollectionViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
            $0.register(SpecialRoomCVC.self, forCellWithReuseIdentifier: SpecialRoomCVC.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.dataSource = self
            $0.delegate = self
            $0.register(HomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.identifier)
            
            $0.register(HomeCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier)
            $0.register(HomeCollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeCollectionViewFooter.identifier)
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
    //  case 0: return CGSize(width: (UIScreen.main.bounds.width), height: 251)
        case 1: return CGSize(width: (UIScreen.main.bounds.width), height: 503)
        case 2: return CGSize(width: (UIScreen.main.bounds.width), height: 457)
        case 3: return CGSize(width: (UIScreen.main.bounds.width), height: 370)
        case 4: return CGSize(width: (UIScreen.main.bounds.width), height: 198)
        case 5: return CGSize(width: (UIScreen.main.bounds.width), height: 463)
    //  case 6: return CGSize(width: (UIScreen.main.bounds.width), height: 359)
        default : return .zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0: return CGSize(width: UIScreen.main.bounds.width, height: 251)
        default: return CGSize(width: UIScreen.main.bounds.width, height: 60)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        switch section {
        case 6: return CGSize(width: UIScreen.main.bounds.width, height: 359)
        default: return CGSize(width: UIScreen.main.bounds.width, height: 60)
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
        return 6//6개로도해보자
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let movieChartCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieChartCVC.identifier, for: indexPath) as? MovieChartCVC else{return UICollectionViewCell()}
        guard let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: EventV.identifier, for: indexPath) as? EventV else{return UICollectionViewCell()}
        guard let movieFeedCVC = collectionView.dequeueReusableCell(withReuseIdentifier: MovieFeedCVC.identifier, for: indexPath) as? MovieFeedCVC else{return UICollectionViewCell()}
        guard let hashtagLottecinemaCVC = collectionView.dequeueReusableCell(withReuseIdentifier: HashtagLottecinemaCVC.identifier, for: indexPath) as? HashtagLottecinemaCVC else{return UICollectionViewCell()}
        guard let SpecialRoomCVC =  collectionView.dequeueReusableCell(withReuseIdentifier: SpecialRoomCVC.identifier, for: indexPath) as? SpecialRoomCVC else{return UICollectionViewCell()}


        
        
        switch indexPath.section {
        case 1 :
            return movieChartCell
        case 2 :
            return eventCell
        case 3 :
            return movieFeedCVC
        case 4 :
            return hashtagLottecinemaCVC
        case 5 :
            return SpecialRoomCVC

        default :
            return UICollectionViewCell()
            
        }
        //cell
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier, for: indexPath) as? HomeCollectionViewHeader else{return UICollectionReusableView()}
        guard let cellHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.identifier, for: indexPath) as? HomeHeaderView else{return UICollectionReusableView()}
        guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeCollectionViewFooter.identifier, for: indexPath) as? HomeCollectionViewFooter else{return UICollectionReusableView()}
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
        case 5 :
            return cellHeader
        case 6 :
            return footer
            
        default :
            return cellHeader
            
        }
    }//헤더 푸터
}
