import UIKit
import SnapKit
import Then

final class HashtagLottecinemaCVC: UICollectionViewCell {
    
    static let identifier = "HashtagLottecinemaCVC"
    
    //moviewchart3, moviechart_4, moviefeed6
    private let photo1 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    private let label1 = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 14)
        $0.textColor = .black
    }
    private let label2 = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 12)
        $0.textColor = .black
    }
    private let label3 = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .g_200
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLayout() {
        self.contentView.addSubviews(photo1,label1,label2,label3)
        
        self.label1.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        self.photo1.snp.makeConstraints {
            $0.top.equalTo(label1.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
            $0.height.equalTo(106)
        }
        self.label2.snp.makeConstraints {
            $0.top.equalTo(photo1.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
        }
        self.label3.snp.makeConstraints {
            $0.top.equalTo(photo1.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
        }
    }
}
