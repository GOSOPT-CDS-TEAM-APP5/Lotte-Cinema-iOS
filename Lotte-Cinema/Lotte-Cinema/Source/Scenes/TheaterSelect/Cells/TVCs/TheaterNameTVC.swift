import UIKit

class TheaterNameTVC: UITableViewCell {
    static let identifier: String = "TheaterNameTVC"
    
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
            self.contentView.backgroundColor = .main_2
            self.titleLabel.textColor = .white
        } else {
            self.contentView.backgroundColor = .g_100
            self.titleLabel.textColor = .black
        }
    }
    
    internal func bindText(title: String) {
        self.titleLabel.text = title
    }
    
    
    private func setLayout() {
        self.contentView.backgroundColor = .g_100
        self.addSubviews(titleLabel, bottomLineView)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        bottomLineView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 14)
        $0.textColor = .black
    }
    private let bottomLineView = UIView().then {
        $0.backgroundColor = .g_200
    }

}
