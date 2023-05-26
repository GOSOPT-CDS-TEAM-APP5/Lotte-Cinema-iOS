//import UIKit
//import SnapKit
//import Then
//
//final class MovieChartCell: UICollectionViewCell {
//    
//    static let identifier = "MovieChartCell"
//    
//    let customview = CustomView()
//    
//    private let MovieChartImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 4
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//    private let MovieChartLabel1: UILabel = {
//        let label1 = UILabel()
//        label1.numberOfLines = 0
//        label1.font = .NotoSansBold(ofSize: 14)
//        label1.textColor = .black
//        return label1
//    }()
//    
//    private let MovieChartLabel2: UILabel = {
//        let label2 = UILabel()
//        label2.numberOfLines = 2
//        label2.font = .NotoSansMedium(ofSize: 10)
//        label2.textColor = .main_1
//        return label2
//    }()
//    
//    private let MovieChartLabel3: UILabel = {
//        let label3 = UILabel()
//        label3.numberOfLines = 0
//        label3.font = .NotoSansLight(ofSize: 10)
//        label3.textColor = .g_200
//        return label3
//    }()
//    
//    private let MovieChartButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("예매하기", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = .NotoSansBold(ofSize: 12)
//        button.backgroundColor = .black
//        // button.makeRoundBorder(cornerRadius: 4, borderWidth: 1, borderColor: .main)
//        //        button.addTarget(self,
//        //                         action: #selector(scrapBookButtonTapped),
//        //                         for: .touchUpInside)
//        return button
//    }()
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setLayout()
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setLayout() {
//        self.addSubviews(MovieChartImageView,
//                         MovieChartLabel1,
//                         MovieChartLabel2,
//                         MovieChartLabel3,
//                         MovieChartButton)
//        
//        MovieChartImageView.snp.makeConstraints {
//            $0.leading.equalToSuperview()
//            $0.top.equalToSuperview()
//        }
//        MovieChartLabel1.snp.makeConstraints {
//            $0.top.equalTo(MovieChartImageView.snp.bottom).offset(8)
//            $0.leading.equalToSuperview()
//        }
//        MovieChartLabel2.snp.makeConstraints {
//            $0.top.equalTo(MovieChartLabel1.snp.bottom).offset(8)
//            $0.leading.equalToSuperview()
//        }
//        MovieChartLabel3.snp.makeConstraints {
//            $0.top.equalTo(MovieChartLabel1.snp.bottom).offset(8)
//            $0.leading.equalTo(MovieChartLabel2.snp.trailing).offset(4)
//        }
//        MovieChartButton.snp.makeConstraints {
//            $0.top.equalTo(MovieChartLabel3.snp.bottom).offset(8)
//            $0.leading.equalToSuperview()
//        }
//    }
//    
//    func configureCell(_ MovieChartDummy: structName) {
//        MovieChartImageView.image = MovieChartDummy.image
//        MovieChartLabel1.text = MovieChartDummy.title
//        MovieChartLabel2.text = MovieChartDummy.state
//        MovieChartLabel3.text = MovieChartDummy.percent
//    }
//}
//
