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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

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

1. 어떤 프로젝트에서 할지 확실시할것
2. 디벨롭서 최신 pull받고 이슈파서 새로 브런치파서 작업
