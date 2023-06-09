import UIKit
import SnapKit
import Then

class EventV: UICollectionViewCell {
    
    static let identifier: String = "EventV"
    
    private let yellowImage = UIImageView(image: UIImage.eventPhoto1)
    private let orangeView = UIView().then {
        $0.backgroundColor = .orange
    }
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
        self.contentView.backgroundColor = .white
        self.contentView.addSubviews(orangeView, yellowImage, Button1, Button2, Button3)
        

        self.orangeView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.width.equalTo(342)
            $0.centerX.centerY.equalToSuperview().inset(16)
        }
        self.yellowImage.snp.makeConstraints {
            $0.top.equalTo(orangeView)
            $0.leading.equalTo(orangeView)
        }
        self.Button1.snp.makeConstraints {
            $0.top.equalTo(orangeView)
            $0.leading.equalToSuperview().offset(16)
        }
        self.Button2.snp.makeConstraints {
            $0.top.equalTo(orangeView)
            $0.leading.equalTo(Button1)
        }
        self.Button3.snp.makeConstraints {
            $0.top.equalTo(orangeView)
            $0.leading.equalTo(Button2)
        }
    }
}
