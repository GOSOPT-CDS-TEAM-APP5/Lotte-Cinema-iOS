import UIKit

class TheaterCategoryTVC: UITableViewCell {
    static let identifier: String = "TheaterCategoryTVC"
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setLayout()
    }
    
    internal func changeBackgroundColor() {
        if self.isSelected {
            self.contentView.backgroundColor = .g_100
        } else {
            self.contentView.backgroundColor = .white
        }
    }
    
    internal func bindText(title: String,
                           seatCount: Int) {
        self.titleLabel.text = title
        self.seatCountLabel.text = "(\(seatCount))"
    }
    
    private func setLayout() {
        self.contentView.addSubviews(titleLabel, seatCountLabel, bottomLineView)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        seatCountLabel.snp.makeConstraints {
            $0.leading.equalTo(self.titleLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(self.titleLabel)
        }
        bottomLineView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 16)
        $0.textColor = .black
    }
    private let seatCountLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 10)
        $0.textColor = .black
    }
    private let bottomLineView = UIView().then {
        $0.backgroundColor = .g_200
    }

}
