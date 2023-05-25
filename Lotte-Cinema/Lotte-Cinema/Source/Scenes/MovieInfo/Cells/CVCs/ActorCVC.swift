import UIKit
import SnapKit
import Then

class ActorCVC: UICollectionViewCell {
    static let identifier: String = "ActorCVC"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func bindText(profileImage: UIImage,
                           name: String,
                           position: String) {
        profileImageView.image = profileImage
        if position != "" {
            self.nameLabel.text = name
            self.positionLabel.text = position
            self.setLayout(isHasPosition: true)
        } else {
            self.nameLabel.text = name
            self.setLayout(isHasPosition: false)
        }
        self.nameLabel.sizeToFit()
    }
    
    private func setLayout(isHasPosition: Bool) {
        DispatchQueue.main.async {
            self.backgroundColor = .white
            self.addSubviews(self.profileImageView, self.nameLabel, self.positionLabel)
            self.profileImageView.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.height.equalTo(62)
            }
            if isHasPosition {
                self.nameLabel.snp.makeConstraints {
                    $0.leading.trailing.bottom.equalToSuperview()
                    $0.top.equalTo(self.profileImageView.snp.bottom).offset(4)
                }
                self.positionLabel.snp.makeConstraints {
                    $0.top.equalTo(self.nameLabel.snp.bottom)
                    $0.leading.trailing.equalToSuperview()
                }
            } else {
                self.nameLabel.snp.makeConstraints {
                    $0.leading.trailing.equalToSuperview()
                    $0.top.equalTo(self.profileImageView.snp.bottom).offset(4)
                }
                self.positionLabel.isHidden = true
            }
        }
    }
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .NotoSansRegular(ofSize: 12)
        $0.textColor = .g_600
        $0.numberOfLines = 2
    }
    private let positionLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .g_200
        $0.numberOfLines = 0
    }
}
