import UIKit
import SnapKit
import Then

class TheaterSelectNavigationView: UIView {
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        self.addSubviews(titleLabel, backButton, bottomLineView)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(44)
        }
        bottomLineView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 20)
        $0.text = "영화관 선택"
        $0.textColor = .black
    }
    private let backButton = UIButton().then {
        $0.setImage(ImageLiterals.icChevronLeft, for: .normal)
    }
    private let bottomLineView = UIView().then {
        $0.backgroundColor = .g_200
    }
}
