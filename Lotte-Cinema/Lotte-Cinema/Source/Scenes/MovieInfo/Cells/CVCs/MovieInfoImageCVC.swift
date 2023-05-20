import UIKit
import SnapKit
import Then

class MovieInfoImageCVC: UICollectionViewCell {
    static let identifier: String = "MovieInfoImageCVC"
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    internal func bindData(image: UIImage) {
        self.imageView.image = image
    }
    
    private func setLayout() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
}
