import UIKit
import SnapKit
import Then

class EventV: UICollectionViewCell {
    
    static let identifier: String = "EventV"
    
    private let eventLabel = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 20)
        $0.textColor = .black
    }
    private let showallButton = UIButton().then {
        $0.setTitle("전체보기 >", for: .normal)
        $0.titleLabel?.font = .NotoSansRegular(ofSize: 12)
        $0.setTitleColor(UIColor.g_400, for: .normal)
    }
    private let yellowImage = UIImageView(image: UIImage.eventPhoto1)
    private let Button1 = UIButton().then {
        $0.setTitle("추천", for: .normal)
        $0.titleLabel?.font = .NotoSansRegular(ofSize: 12)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .g_100
    }
    private let Button2 = UIButton().then {
        $0.setTitle("영화", for: .normal)
        $0.titleLabel?.font = .NotoSansRegular(ofSize: 12)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .sm_green
    }
    private let Button3 = UIButton().then {
        $0.setTitle("제휴", for: .normal)
        $0.titleLabel?.font = .NotoSansRegular(ofSize: 12)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .sm_green
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
        self.contentView.addSubviews(eventLabel, showallButton, yellowImage, Button1, Button2, Button3)
        self.eventLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        self.showallButton.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.yellowImage.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.Button1.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.Button2.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.Button3.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
