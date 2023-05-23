import UIKit
import SnapKit
import Then

class TrailerCVC: UICollectionViewCell {
    static let identifier: String = "TrailerCVC"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.titleLabel.text = ""
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func bindData(image: UIImage,
                          title: String) {
        self.imageView.image = image
        self.titleLabel.text = title
    }
    
    private func setLayout() {
        self.contentView.backgroundColor = .black
        self.contentView.addSubviews(imageView, titleLabel)
        self.imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 10)
        $0.textColor = .white
    }
}
