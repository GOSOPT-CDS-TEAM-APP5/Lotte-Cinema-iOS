//import UIKit
//
//import SnapKit
//import Then
//
//final class HashtagLottecinemaCVC: UICollectionViewCell {
//    
//    static let identifier = "HashCell"
//    
//    //moviewchart3, moviechart_4, moviefeed6
//    private let photo1 = UIImageView().then {
//        $0.image = .moviechart3
//    }
//    private let photo2 = UIImageView().then {
//        $0.image = .moviechart_4
//    }
//    private let photo3 = UIImageView().then {
//        $0.image = .moviefeed6
//    }
//    private let label = UILabel().then {
//        $0.text = "#롯데시네마 픽"
//        $0.textColor = .white
//        $0.font = UIFont.boldSystemFont(ofSize: 20)
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setStyle()
//        setLayout()
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setStyle() {
//        label.do {
//            $0.tintColor = .white
//        }
//    }
//    
//    func setLayout() {
//        
//        contentView.addSubview(photo1)
//        contentView.addSubview(photo2)
//        contentView.addSubview(photo3)
//        contentView.addSubview(label)
//        
//        photo1.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//        photo2.snp.makeConstraints {
//            
//        }
//        
//        photo3.snp.makeConstraints {
//            
//        }
//        
//        label.snp.makeConstraints {
//            $0.leading.bottom.equalToSuperview().inset(5)
//            $0.size.equalTo(30)
//        }
//        
//        
//    }
//    
//    func configureCell(_ photo: UIImage) {
//        
//        photoImage.image = UIImage.logophoto
//    }
//}
