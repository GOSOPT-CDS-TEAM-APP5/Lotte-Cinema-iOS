import UIKit
import SnapKit
import Then

class MovieInfoTabbar: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    
    private func setLayout() {
        self.addSubviews(movieInfoLabel, ratingInfoLabel, bottomLineView, selectedViewLine)
        
        movieInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2.0)
        }
        ratingInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2.0)
        }
        bottomLineView.snp.makeConstraints {
            $0.top.equalTo(self.ratingInfoLabel.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        selectedViewLine.snp.makeConstraints {
            $0.centerY.equalTo(self.bottomLineView)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(self.ratingInfoLabel.snp.leading)
            $0.height.equalTo(2)
        }
    }
    
    @objc private func didMovieInfoLabelTapped() {
        UIView.animate(withDuration: 0.3) {
            self.selectedViewLine.transform = .identity
        } completion: { _ in
            self.movieInfoLabel.textColor = .black
            self.ratingInfoLabel.textColor = .g_200
        }
    }
    
    @objc private func didRatingLabelTapped() {
        UIView.animate(withDuration: 0.3) {
            self.selectedViewLine.transform = .init(translationX: (UIScreen.main.bounds.width / 2) - 16,
                                                    y: 0)
        } completion: { _ in
            self.movieInfoLabel.textColor = .g_200
            self.ratingInfoLabel.textColor = .black
        }
    }
    
    private lazy var movieInfoLabel = UILabel().then {
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                       action: #selector(didMovieInfoLabelTapped)))
        $0.text = "영화정보"
        $0.font = .NotoSansRegular(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    
    private lazy var ratingInfoLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 14)
        $0.textColor = .g_200
        $0.textAlignment = .center
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                       action: #selector(didRatingLabelTapped)))
        $0.attributedText = "평점 및 관람평 (1,600)".setAttributeString(range: .init(location: 8, length: "평점 및 관람평 (1,600)".count - 8),
                                                                  font: .NotoSansRegular(ofSize: 10),
                                                                  textColor: .g_200)
        $0.isUserInteractionEnabled = true
    }
    
    private let bottomLineView = UIView().then {
        $0.backgroundColor = .g_100
    }
    
    private let selectedViewLine = UIView().then {
        $0.backgroundColor = .black
    }
}
