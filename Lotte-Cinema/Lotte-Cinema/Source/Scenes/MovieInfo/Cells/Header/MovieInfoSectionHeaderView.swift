import UIKit
import SnapKit
import Then

enum MovieInfoCellType {
    case synopsys
    case actors
    case trailer
    case poster
}

class MovieInfoSectionHeaderView: UICollectionReusableView {
    
    static let identifier: String = "MovieInfoSectionHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func bindHeader(type: MovieInfoCellType,
                            rowCount: Int = 0) {
        DispatchQueue.main.async {
            self.addSubview(self.titleLabel)
            self.titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(24)
                $0.leading.equalToSuperview().offset(16)
            }
            
            switch type {
            case .synopsys:
                self.backgroundColor = .white
                self.addSubview(self.expandButton)
                self.expandButton.snp.makeConstraints {
                    $0.trailing.equalToSuperview().inset(16)
                    $0.centerY.equalTo(self.titleLabel)
                    $0.width.equalTo(60)
                }
                self.titleLabel.text = "시놉시스"
                self.titleLabel.textColor = .black
            case .actors:
                self.backgroundColor = .white
                self.titleLabel.text = "감독 및 출연"
                self.titleLabel.textColor = .black
            case .trailer:
                self.backgroundColor = .black
                self.addSubview(self.rowCountLabel)
                self.rowCountLabel.snp.makeConstraints {
                    $0.leading.equalTo(self.titleLabel.snp.trailing).offset(5)
                    $0.centerY.equalTo(self.titleLabel)
                }
                self.titleLabel.text = "트레일러"
                self.rowCountLabel.text = "(\(rowCount))"
                self.titleLabel.textColor = .white
                self.rowCountLabel.textColor = .white
            case .poster:
                self.backgroundColor = .black
                self.addSubview(self.rowCountLabel)
                self.rowCountLabel.snp.makeConstraints {
                    $0.leading.equalTo(self.titleLabel.snp.trailing).offset(5)
                    $0.centerY.equalTo(self.titleLabel)
                }
                self.titleLabel.text = "포스터 / 스틸컷"
                self.rowCountLabel.text = "(\(rowCount))"
                self.titleLabel.textColor = .white
                self.rowCountLabel.textColor = .white
            }
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 14)
        $0.textColor = .black
    }
    
    private let expandButton = UIButton().then {
        $0.backgroundColor = .clear
        var config = UIButton.Configuration.plain()
        config.image = ImageLiterals.icExpand
        config.imagePlacement = .trailing
        config.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.attributedTitle = AttributedString("펼쳐보기".setAttributeString(range: .init(location: 0, length: "펼쳐보기".count),
                                                                            font: .NotoSansMedium(ofSize: 10),
                                                                            textColor: .g_400))
        $0.configuration = config
    }
    
    private let rowCountLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .white
    }
        
}
