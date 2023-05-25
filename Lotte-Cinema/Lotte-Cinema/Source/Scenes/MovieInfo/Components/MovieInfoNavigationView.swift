import UIKit
import Then
import SnapKit

class MovieInfoNavigationView: UIView {
    var backButtonTappedCompletion: (() -> Void)?
    var homeButtonTappedCompletion: (() -> Void)?
    
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
    
    @objc private func didHomeButtonTapped() {
        guard let completion = homeButtonTappedCompletion else {return}
        completion()
    }

    
    private func setLayout() {
        self.backgroundColor = .black
        self.addSubviews(titleLabel, popButton, homeButton)
        popButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.width.height.equalTo(36)
            $0.bottom.equalToSuperview().inset(13)
        }
        homeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.width.height.equalTo(36)
            $0.bottom.equalToSuperview().inset(13)
        }
        self.titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.popButton)
            $0.leading.equalTo(self.popButton.snp.trailing).offset(74)
            $0.trailing.equalTo(self.homeButton.snp.leading).inset(-74)
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
        $0.setImage(ImageLiterals.icBack, for: .normal)
    }
    private lazy var homeButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(self.didHomeButtonTapped),
                     for: .touchUpInside)
        $0.setImage(ImageLiterals.icHome, for: .normal)
    }
}

