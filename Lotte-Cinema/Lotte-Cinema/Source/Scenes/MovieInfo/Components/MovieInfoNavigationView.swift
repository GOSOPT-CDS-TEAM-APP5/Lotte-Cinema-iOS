import UIKit
import Then
import SnapKit

class MovieInfoNavigationView: UIView {
    var backButtonTappedCompletion: (() -> Void)?
    var homeButtonTappedCompletion: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    private let titleLable = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 14)
        $0.textColor = .white
    }
    
    
    @objc private func didBackButtonTapped() {
        guard let completion = backButtonTappedCompletion else {return}
        completion()
    }
    
    @objc private func didHomeButtonTapped() {
        guard let completion = homeButtonTappedCompletion else {return}
        completion()
    }
    
    private lazy var popButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(self.didBackButtonTapped),
                     for: .touchUpInside)
        $0.setImage(ImageLiterals.icChevronRight, for: .normal)
    }
    private lazy var homeButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(self.didHomeButtonTapped),
                     for: .touchUpInside)
        $0.setImage(ImageLiterals.icHome, for: .normal)
    }
}

