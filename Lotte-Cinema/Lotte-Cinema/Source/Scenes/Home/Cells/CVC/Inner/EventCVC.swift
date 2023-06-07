import UIKit
import SnapKit
import Then
//더미데이터 만들어야함.
class EventCVC: UICollectionViewCell {
    static let identifier: String = "EventCVC"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let titleLabel1 = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 15)
        $0.textColor = .black
    }
    private let titleLabel2 = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 15)
        $0.textColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.imageView.image = nil
//        self.titleLabel.text = ""
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    internal func bindData(image: UIImage,
//                          title: String) {
//        self.imageView.image = image
//        self.titleLabel.text = title
//    }
    
    private func setLayout() {
        self.contentView.backgroundColor = .black
        self.contentView.addSubviews(imageView, titleLabel1, titleLabel2)
        self.imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        titleLabel1.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        titleLabel2.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
