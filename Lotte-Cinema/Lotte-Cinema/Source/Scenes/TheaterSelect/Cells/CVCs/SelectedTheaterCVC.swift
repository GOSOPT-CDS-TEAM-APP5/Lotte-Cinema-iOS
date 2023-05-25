import UIKit

class SelectedTheaterCVC: UICollectionViewCell {
    static let identifier: String = "SelectedTheaterCVC"
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        self.contentView.layer.cornerRadius = 15
        self.contentView.clipsToBounds = true
        self.contentView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.makeCornerRound(radius: 16)
    }
    
    internal func bindText(title: String) {
        self.titleLabel.text = title
        DispatchQueue.main.async {
            self.setBackgroundColor()
        }
    }
    
    private func setBackgroundColor() {
        self.setGradient(color1: .main_1, color2: .main_2)
    }
    
    private func setLayout() {
        self.contentView.addSubview(backGroundView)
        backGroundView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        backGroundView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

    }
    
    private let backGroundView = UIView().then {
        $0.backgroundColor = .clear
    }
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 12)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
}
