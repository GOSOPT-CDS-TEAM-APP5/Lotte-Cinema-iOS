import Foundation
import UIKit
import SnapKit
import Then

class FloatingButtton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init() {
        super.init(frame: .init(origin: .zero,
                                size: .init(width: 300,
                                            height: 48)))
        self.setBackgroundGradient()
        self.setLayout()
    }
    
    private func setBackgroundGradient() {
        self.setGradient(color1: .main_1, color2: .main_2)
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }
    
    private func setLayout() {
        self.addSubviews(shareImageButton, likeButton, textLabel)
        shareImageButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(48)
        }
        likeButton.snp.makeConstraints {
            $0.leading.equalTo(shareImageButton.snp.trailing).inset(10)
            $0.width.height.equalTo(48)
            $0.centerY.equalToSuperview()
        }
        textLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(32)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    private let shareImageButton = UIButton().then {
        $0.setImage(ImageLiterals.ic_share, for: .normal)
    }
    private let likeButton = UIButton().then {
        $0.setImage(ImageLiterals.iconUnFillHeart, for: .normal)
    }
    private let textLabel = UILabel().then {
        $0.text = "예매하기"
        $0.font = .NotoSansRegular(ofSize: 14)
        $0.textColor = .white
    }
}
