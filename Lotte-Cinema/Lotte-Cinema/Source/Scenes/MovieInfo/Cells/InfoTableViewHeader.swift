import UIKit
import SnapKit
import Then

class InfoTableViewHeader: UIView {
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /**
     이거 도대체 왜,, 리딩 트레일링으로 오토레이아웃 잡으려하면 난리가 나는질 모르겟네..
     혹시나 이유를 아신다면 살려주세요
     */
    private func setLayout() {
        self.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        contentView.addSubviews(backGroundImageView, contentBackgroundView)
        
        self.backGroundImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(49)
            $0.leading.trailing.equalToSuperview()
        }
        self.contentBackgroundView.snp.makeConstraints {
            $0.top.equalTo(backGroundImageView.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        contentBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentBackgroundView.layer.cornerRadius = 10
        
        self.contentBackgroundView.addSubviews(movieImageView, titleLabel, descriptionLabel, cinemaChipInfoView)
        
        movieImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(108)
            $0.height.equalTo(153)
        }
        
        cinemaChipInfoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.movieImageView.snp.bottom).offset(13)
            $0.bottom.equalToSuperview().inset(19)
            $0.height.equalTo(52)
            $0.width.equalTo(UIScreen.main.bounds.width - 46)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.width.equalTo(141 * UIScreen.main.bounds.width / 375.0)
            $0.leading.equalToSuperview().offset(142)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.width.equalTo(128 * UIScreen.main.bounds.width / 375.0)
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(12)
        }
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .black
    }
    private let backGroundImageView = UIImageView(image: ImageLiterals.imgGogBackground).then {
        $0.contentMode = .scaleAspectFill
    }
    private let contentBackgroundView = UIView().then {
        $0.backgroundColor = .white
    }
    private let movieImageView = UIImageView(image: ImageLiterals.imgGog)
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 16)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.text = "가디언즈 오브 갤럭시: Volume 3"
    }
    private let descriptionLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 12)
        $0.textColor = .g_400
        $0.numberOfLines = 0
        $0.text = "액션/미국\n2023.05.03 개봉    150분"
    }
    private let cinemaChipInfoView = CinemaInfoView()
}
