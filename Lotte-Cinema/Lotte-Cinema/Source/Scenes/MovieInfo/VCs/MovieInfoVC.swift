import UIKit
import SnapKit
import Then
import Alamofire

class MovieInfoVC: UIViewController {
    /**
     해당하는 movieID value 변경 시 조회되는 이미지가 달라집니다...
     */
    private var _movieID: Int = 1
    internal var movieID: Int {
        get {
            return _movieID
        }
        set(id) {
            _movieID = id
        }
    }
    var movieInfoData: MovieInfoData?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getMovieInfoData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    //MARK: - Configuration
    private func setTableViewConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout = self.getLayout()
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        
        //header
        self.collectionView.register(InfoCollectionViewHeader.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: InfoCollectionViewHeader.identifier)
        self.collectionView.register(MovieInfoSectionHeaderView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: MovieInfoSectionHeaderView.identifier)
        
        //cell
        self.collectionView.register(MovieInfoImageCVC.self,
                                     forCellWithReuseIdentifier: MovieInfoImageCVC.identifier)
        self.collectionView.register(SynopsisCVC.self,
                                     forCellWithReuseIdentifier: SynopsisCVC.identifier)
        self.collectionView.register(ActorBackgroundCVC.self,
                                     forCellWithReuseIdentifier: ActorBackgroundCVC.identifier)
        self.collectionView.register(TrailerCVC.self,
                                     forCellWithReuseIdentifier: TrailerCVC.identifier)
        self.collectionView.register(PosterBackgroundCVC.self,
                                     forCellWithReuseIdentifier: PosterBackgroundCVC.identifier)
    }
    
    //MARK: - Layout
    func getLayout() -> UICollectionViewCompositionalLayout {
            let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
                switch section {
                case 0:
                    let headerSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(505)
                    )
                    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(101)
                    )
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.boundarySupplementaryItems = [sectionHeader]
                    return section
                    
                case 1:
                    let headerSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(51)
                    )
                    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(65)
                    )
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    
                    let section = NSCollectionLayoutSection(group: group)
                    
                    section.boundarySupplementaryItems = [sectionHeader]
                    return section
                    
                case 2:
                    let headerSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(41)
                    )
                    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(172)
                    )
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    section.boundarySupplementaryItems = [sectionHeader]
                    return section
                    
                case 3:
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(120)
                    )
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .continuous
                    return section
                    
                    
                case 4:
                    let headerSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(64)
                    )
                    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: -8)
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.4),
                        heightDimension: .absolute(128)
                    )
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                    section.boundarySupplementaryItems = [sectionHeader]
                    section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                    return section
                    
                default:
                    let headerSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(64)
                    )
                    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(181)
                    )
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
                    section.boundarySupplementaryItems = [sectionHeader]
                    section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                    return section
                }
            }
        return layout
        
    }
    
    private func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubviews(collectionView, navigationView, floatingButton)
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
        }
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        floatingButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(48)
        }
        self.navigationView.backButtonTappedCompletion = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    @objc private func didFloatingButtonTapped() {
        //영화관 선택 뷰 구현
        let vc = TheaterSelectVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //MARK: - Network
    private func getMovieInfoData() {
        GetService.shared.getService(from: Constants.baseURL + "/detail/\(self.movieID)",
                                     isTokenUse: false) {
            (data: MovieInfoDataModel?, error) in
            guard let data = data else {
                print("error: \(error?.debugDescription)")
                return
            }
            self.movieInfoData = data.data
            self.navigationView.titleLabel.text = data.data.movieName
            self.collectionView.reloadData()
        }
    }
    
    //MARK: - Components
    private let navigationView = MovieInfoNavigationView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.contentInset = .init(top: 49, left: 0, bottom: 0, right: 0)
        $0.backgroundColor = .black
    }
    private lazy var floatingButton = FloatingButtton().then {
        $0.addTarget(self,
                     action: #selector(didFloatingButtonTapped),
                     for: .touchUpInside)
    }

}

extension MovieInfoVC: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > 0 {
            UIView.animate(withDuration: 0.3) {
                self.navigationView.transform = .init(translationX: 0, y: -self.navigationView.frame.height)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.navigationView.transform = .identity
            }
        }
    }
}
extension MovieInfoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                           withReuseIdentifier: MovieInfoSectionHeaderView.identifier,
                                                                           for: indexPath) as? MovieInfoSectionHeaderView else {return UICollectionReusableView()}
        switch indexPath.section {
        case 0:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                               withReuseIdentifier: InfoCollectionViewHeader.identifier,
                                                                               for: indexPath) as? InfoCollectionViewHeader else {return UICollectionReusableView()}
            if let data = movieInfoData {
                header.bindData(movieName: data.movieName,
                                reservation: data.reservationRatio,
                                scoreOfStar: data.scoreOfStar,
                                genre: data.genre,
                                playFullTime: data.playFullTime)
            }
            return header
        case 1:
            sectionHeader.bindHeader(type: .synopsys)
            return sectionHeader
        case 2:
            sectionHeader.bindHeader(type: .actors)
            return sectionHeader
        case 4:
            sectionHeader.bindHeader(type: .trailer, rowCount: trailerData.count)
            return sectionHeader
        default:
            sectionHeader.bindHeader(type: .poster, rowCount: posterData.count)
            return sectionHeader
        }

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 5: return 1
        default: return trailerData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieInfoImageCVC.identifier, for: indexPath) as? MovieInfoImageCVC else {return UICollectionViewCell()}
        
        switch indexPath.section {
        case 0:
            imageCell.bindData(image: ImageLiterals.imgAudienceInfo)
            return imageCell
        case 1:
            guard let synopsysCell = collectionView.dequeueReusableCell(withReuseIdentifier: SynopsisCVC.identifier, for: indexPath) as? SynopsisCVC else {return UICollectionViewCell()}
            if let data = self.movieInfoData {
                synopsysCell.bindText(content: data.synopsis)
            }
//            synopsysCell.bindText(content: "‘가모라'를 잃고 슬픔에 빠져 있던 ‘피터 퀼'이 위기에 처한 은하계와 동료를 지키기 위해 다시 한번 가디언즈 팀과 힘을 모으고, 성공하지 못할 경우 그들의 마지막이 될지도 모르는 미션에 나서는 이야기")
            return synopsysCell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorBackgroundCVC.identifier, for: indexPath) as? ActorBackgroundCVC else {return UICollectionViewCell()}
            return cell
        case 3:
            imageCell.bindData(image: ImageLiterals.img_kbbanner)
            return imageCell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrailerCVC.identifier, for: indexPath) as? TrailerCVC else {return UICollectionViewCell()}
            cell.bindData(image: trailerData[indexPath.row].image,
                          title: trailerData[indexPath.row].title)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterBackgroundCVC.identifier, for: indexPath) as? PosterBackgroundCVC else {return UICollectionViewCell()}
            return cell
        }
        return UICollectionViewCell()
    }
}

