import UIKit
import SnapKit
import Then

final class SpecialRoomCVC: UICollectionViewCell {
    
    static let identifier: String = "SpecialRoomCVC"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    private let titleLabel1 = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 14)
        $0.textColor = .black
    }
    private let titleLabel2 = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 14)
        $0.textColor = .main_1
    }
    private let titleLabel3 = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 12)
        $0.textColor = .black
    }
    private let titleLabel4 = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .g_200
    }
    
    func setLayout() {
        self.contentView.addSubviews(imageView,titleLabel1,titleLabel2,titleLabel3,titleLabel4)
        
        self.titleLabel1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        self.titleLabel2.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(4)
        }
        self.imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel1.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(137)
            $0.height.equalTo(106)
        }
        self.titleLabel3.snp.makeConstraints {
            $0.top.equalTo(imageView).offset(12)
            $0.leading.equalToSuperview().offset(17)
        }
        self.titleLabel4.snp.makeConstraints {
            $0.top.equalTo(titleLabel3.snp.bottom)
            $0.leading.equalToSuperview().offset(17)
        }
    }
}
