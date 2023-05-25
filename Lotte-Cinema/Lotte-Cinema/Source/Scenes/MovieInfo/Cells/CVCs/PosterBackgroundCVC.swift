import UIKit
import SnapKit
import Then

class PosterBackgroundCVC: UICollectionViewCell {
    static let identifier: String = "PosterBackgroundCVC"
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        self.setCollectionLayout()
        self.setCollectionViewConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    
    private func setLayout() {
        self.contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(PosterCVC.self,
                                     forCellWithReuseIdentifier: PosterCVC.identifier)
    }
    
    private func setCollectionLayout() {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.backgroundColor = .black
    }
    
}

extension PosterBackgroundCVC: UICollectionViewDelegate {}
extension PosterBackgroundCVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCVC.identifier,
                                                            for: indexPath) as? PosterCVC else {return UICollectionViewCell()}
        cell.bindImage(image: posterData[indexPath.row])
        return cell
    }
    
    
}
extension PosterBackgroundCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return posterData[indexPath.row].size
    }
}
