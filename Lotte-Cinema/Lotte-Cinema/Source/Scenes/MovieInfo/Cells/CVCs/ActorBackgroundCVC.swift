import UIKit
import SnapKit
import Then

class ActorBackgroundCVC: UICollectionViewCell {
    static let identifier: String = "ActorBackgroundCVC"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setCollectionViewConfig()
        self.setCollectionLayout()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(ActorCVC.self,
                                     forCellWithReuseIdentifier: ActorCVC.identifier)
    }
    
    private func setCollectionLayout() {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 62, height: 82)
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 16, bottom: 52, right: 0)
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func setLayout() {
        self.contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
    }
    
}
extension ActorBackgroundCVC: UICollectionViewDelegate {}
extension ActorBackgroundCVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCVC.identifier,
                                                            for: indexPath) as? ActorCVC else {return UICollectionViewCell()}
        cell.bindText(profileImage: actorData[indexPath.row].profileImages,
                      name: actorData[indexPath.row].names,
                      position: actorData[indexPath.row].position)
        return cell
    }
}

