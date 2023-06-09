import UIKit
import SnapKit
import Then

final class MovieFeedCVC: UICollectionViewCell {
    
    static let identifier: String = "MovieFeedCVC"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private let movieFeed1 = UIImageView(image: UIImage.moviefeed1)
    private let movieFeed2 = UIImageView(image: UIImage.moviefeed2)
    private let movieFeed3 = UIImageView(image: UIImage.moviefeed3)

    
    func setLayout() {
        self.contentView.addSubviews(movieFeed1,movieFeed2,movieFeed3)
        
        self.movieFeed1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(37)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(341)
            $0.height.equalTo(164)
        }
        self.movieFeed2.snp.makeConstraints {
            $0.top.equalTo(movieFeed1.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(167)
            $0.height.equalTo(109)
        }
        self.movieFeed3.snp.makeConstraints {
            $0.top.equalTo(movieFeed1.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(17)
            $0.width.equalTo(167)
            $0.height.equalTo(109)
        }
    }
}
