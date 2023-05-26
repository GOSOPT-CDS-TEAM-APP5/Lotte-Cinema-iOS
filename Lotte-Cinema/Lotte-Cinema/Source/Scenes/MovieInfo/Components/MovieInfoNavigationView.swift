import UIKit
import Then
import SnapKit

class MovieInfoNavigationView: UIView {
    var backButtonTappedCompletion: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    @objc private func didBackButtonTapped() {
        guard let completion = backButtonTappedCompletion else {return}
        completion()
    }

    
    private func setLayout() {
        self.backgroundColor = .black
        self.addSubviews(titleLabel, popButton)
        popButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.width.height.equalTo(44)
            $0.bottom.equalToSuperview().inset(13)
        }
        self.titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.popButton)
            $0.leading.equalTo(self.popButton.snp.trailing).offset(74)
            $0.trailing.equalToSuperview().inset(122)
        }
    }
    
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 14)
        $0.textColor = .white
        $0.text = "가디언즈 오브 갤럭시: Volume3"
        $0.textAlignment = .center
    }
    
    private lazy var popButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(self.didBackButtonTapped),
                     for: .touchUpInside)
        $0.setImage(ImageLiterals.icon_white_back, for: .normal)
    }
}

