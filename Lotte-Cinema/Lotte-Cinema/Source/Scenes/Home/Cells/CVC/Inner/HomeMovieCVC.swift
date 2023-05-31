//
//  HomeMovieCVC.swift
//  Lotte-Cinema
//
//  Created by 박익범 on 2023/05/26.
//

import UIKit

class HomeMovieCVC: UICollectionViewCell {
    static let identifier: String = "HomeMovieCVC"
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func bindText(title: String,
                           ratio: Double,
                           scoreOfStar: Double,
                           image: UIImage) {
        self.imageView.image = image
        self.titleLabel.text = title
        self.reservationPercentageLabel.text = "\(ratio)%"
        self.starPercentLabel.text = "\(scoreOfStar)"
    }
    
    private func setLayout() {
        self.contentView.addSubviews(imageView, titleLabel, likeButton, reservationLabel, reservationPercentageLabel, devideLabel, starImageView, starPercentLabel, reservationButton)
        self.imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(184)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(8)
            $0.leading.equalTo(self.imageView.snp.leading)
        }
        self.likeButton.snp.makeConstraints {
            $0.trailing.equalTo(self.imageView.snp.trailing)
            $0.top.equalTo(self.titleLabel.snp.top)
            $0.width.height.equalTo(12)
        }
        self.reservationLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.width.equalTo(28)
        }
        self.reservationPercentageLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.reservationLabel)
            $0.leading.equalTo(self.reservationLabel.snp.trailing).offset(4)
        }
        self.devideLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.reservationPercentageLabel.snp.trailing).offset(8)
        }
        self.starImageView.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.devideLabel.snp.trailing).offset(8)
            $0.width.height.equalTo(10)
        }
        self.starPercentLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.starImageView.snp.trailing).offset(8)
        }
        self.reservationLabel.snp.makeConstraints{
            $0.top.equalTo(self.reservationLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
            $0.height.equalTo(28)
            $0.width.equalTo(91)
        }
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 14)
        $0.textColor = .black
    }
    private let likeButton = UIButton().then {
        $0.setImage(ImageLiterals.iconUnFillHeart, for: .normal)
    }
    private let reservationLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .main_1
        $0.text = "예매율"
    }
    private let reservationPercentageLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .g_200
    }
    private let devideLabel = UILabel().then {
        $0.textColor = .g_200
        $0.text = "|"
    }
    private let starImageView = UIImageView(image: ImageLiterals.iconStar)
    private let starPercentLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .g_200
    }
    private let reservationButton = UIButton().then {
        $0.setTitle("예매하기", for: .normal)
        $0.setTitleColor( UIColor.black, for: .normal)
        $0.titleLabel?.font = .NotoSansMedium(ofSize: 12)
        $0.layer.cornerRadius = 16
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
    }
}
