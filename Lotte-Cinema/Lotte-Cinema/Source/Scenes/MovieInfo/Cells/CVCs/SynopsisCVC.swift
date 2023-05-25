import UIKit

class SynopsisCVC: UICollectionViewCell {
    static let identifier: String = "SynopsisCVC"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    internal func bindText(content: String) {
        self.synopsysTextLabel.text = content
        self.setLayout()
    }
    
    private func setLayout() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(synopsysTextLabel)
        synopsysTextLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private let synopsysTextLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 12)
        $0.textColor = .g_400
        $0.numberOfLines = 0
    }
}
