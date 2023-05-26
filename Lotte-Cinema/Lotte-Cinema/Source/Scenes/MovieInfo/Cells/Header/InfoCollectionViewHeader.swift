import UIKit
import SnapKit
import Then

class InfoCollectionViewHeader: UICollectionReusableView {
    static let identifier: String = "InfoCollectionViewHeader"
    private var descriptionText: String = "액션/미국\n2023.05.03 개봉    "
    
    init() {
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /**
     추후 서버 연동시 수정
     */
    internal func bindData(movieName: String,
                           reservation: Double,
                           scoreOfStar: Double,
                           genre: String,
                           playFullTime: Int) {
        self.movieAudienceInfoView.bindTextData(audienceRating: scoreOfStar,
                                                reservationRating: reservation,
                                                cumulativeNumber: 1306526)
        self.descriptionLabel.text = "\(genre)/미국\n2023.05.03 개봉    \(playFullTime)분"
        self.titleLabel.text = movieName
    }
    
    
    private func setLayout() {
        self.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        contentView.addSubviews(backGroundImageView, contentBackgroundView)
        
        self.backGroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        self.contentBackgroundView.snp.makeConstraints {
            $0.top.equalTo(backGroundImageView.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        contentBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentBackgroundView.layer.cornerRadius = 10
        
        self.contentBackgroundView.addSubviews(movieImageView, titleLabel, descriptionLabel, cinemaChipInfoView, movieAudienceInfoView, movieInfoTabbar)
        
        movieImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(108)
            $0.height.equalTo(153)
        }
        
        cinemaChipInfoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.movieImageView.snp.bottom).offset(13)
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
        
        movieAudienceInfoView.snp.makeConstraints {
            $0.top.equalTo(self.cinemaChipInfoView.snp.bottom).offset(17)
            $0.height.equalTo(84)
            $0.leading.trailing.equalToSuperview()
        }
        movieInfoTabbar.snp.makeConstraints {
            $0.top.equalTo(movieAudienceInfoView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
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
    }
    private let descriptionLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 12)
        $0.textColor = .g_400
        $0.numberOfLines = 0
    }
    private let cinemaChipInfoView = CinemaInfoView()
    private let movieAudienceInfoView = MovieAudienceInfoView()
    private let movieInfoTabbar = MovieInfoTabbar()
}
