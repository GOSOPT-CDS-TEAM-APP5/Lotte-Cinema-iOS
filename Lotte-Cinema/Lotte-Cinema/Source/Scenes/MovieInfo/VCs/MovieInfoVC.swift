import UIKit

class MovieInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    //MARK: - Configuration
    private func setTableViewConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.setCollectionViewLayout(self.getLayout(), animated: false)
        
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
        self.collectionView.register(ActorCVC.self,
                                     forCellWithReuseIdentifier: ActorCVC.identifier)
    }
    
    //MARK: - Layout
    func getLayout() -> UICollectionViewCompositionalLayout {
            UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
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
                        widthDimension: .absolute(78),
                        heightDimension: .absolute(82)
                    )
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                    group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
                    let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .continuous
                    section.boundarySupplementaryItems = [sectionHeader]
                    return section
                    
                default:
                    // Item
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                    // Group
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(101)
                    )
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                    
                    // Section
                    let section = NSCollectionLayoutSection(group: group)
                    return section
                }
            }
        }
    
    private func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubviews(collectionView, navigationView)
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
        }
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Components
    private let navigationView = MovieInfoNavigationView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.contentInset = .init(top: 49, left: 0, bottom: 0, right: 0)
        $0.backgroundColor = .white
    }

}

extension MovieInfoVC: UICollectionViewDelegate {}
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
            return header
        case 1:
            sectionHeader.bindHeader(type: .synopsys)
            return sectionHeader
        case 2:
            sectionHeader.bindHeader(type: .actors)
            return sectionHeader
        case 4:
            sectionHeader.bindHeader(type: .trailer)
            return sectionHeader
        case 5:
            sectionHeader.bindHeader(type: .poster)
            return sectionHeader
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return actorData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieInfoImageCVC.identifier, for: indexPath) as? MovieInfoImageCVC else {return UICollectionViewCell()}
        guard let synopsysCell = collectionView.dequeueReusableCell(withReuseIdentifier: SynopsisCVC.identifier, for: indexPath) as? SynopsisCVC else {return UICollectionViewCell()}
        guard let actorCell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCVC.identifier, for: indexPath) as? ActorCVC else {return UICollectionViewCell()}
        
        
        switch indexPath.section {
        case 0:
            imageCell.bindData(image: ImageLiterals.imgAudienceInfo)
            return imageCell
        case 1:
            synopsysCell.bindText(content: "‘가모라'를 잃고 슬픔에 빠져 있던 ‘피터 퀼'이 위기에 처한 은하계와 동료를 지키기 위해 다시 한번 가디언즈 팀과 힘을 모으고, 성공하지 못할 경우 그들의 마지막이 될지도 모르는 미션에 나서는 이야기")
            return synopsysCell
        case 2:
            actorCell.bindText(profileImage: actorData[indexPath.row].profileImages,
                               name: actorData[indexPath.row].names,
                               position: actorData[indexPath.row].position)
            return actorCell
        default:
            return UICollectionViewCell()
        }
        
    }
    

}
