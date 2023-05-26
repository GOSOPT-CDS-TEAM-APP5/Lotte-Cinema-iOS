//
//  movieHeaderView.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//

import UIKit
import SnapKit
import Then

final class MovieHeaderView: UICollectionReusableView {
    
    //MARK: Property
    static let identifier = "movieHeaderView"
    var categoryText = "액션"
    var countryText = "미국"
    var dataLabel = "2023.05.03 개봉"
    var runningTimeText = "150분"
    
    //MARK: UI Components
    private lazy var infoStackview = UIStackView().then {
        $0.addArrangeSubviews(posterImageView,vStackView)
        $0.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        $0.spacing = 15
        $0.alignment = .center
    }
    
    private lazy var vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.addArrangeSubviews(titleLabel,subinfoLabel,timeinfoLabel,buttonStackView)
        $0.setCustomSpacing(7, after: titleLabel)
        $0.setCustomSpacing(4, after: subinfoLabel)
        $0.setCustomSpacing(9, after: timeinfoLabel)
        $0.alignment = .leading
    }
    
    private let posterImageView = UIImageView().then {
        $0.backgroundColor = .gray
        $0.image = .load(name: "gog_post")
        $0.frame = CGRect(x: 0, y: 0, width: 70, height: 100)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "가디언즈 오브 갤럭시: Volume 3"
        $0.font = .NotoSansRegular(ofSize: 16)
    }
    
    
    private lazy var subinfoLabel = UILabel().then {
        $0.text = categoryText + " ˙ " + countryText
        $0.font = .NotoSansRegular(ofSize: 10)
        $0.textColor = .g_400
    }
    
    private lazy var timeinfoLabel  = UILabel().then {
        $0.text = dataLabel + " ˙ " + runningTimeText
        $0.font = .NotoSansRegular(ofSize: 10)
        $0.textColor = .g_400
    }
    
    
    
    private let headerLine = UIView().then {
        $0.backgroundColor = .g_100
    }
    
    private let footerLine = UIView().then {
        $0.backgroundColor = .g_100
    }
    
    private lazy var buttonStackView = UIStackView().then {
        $0.addArrangeSubviews(infoButton,selectButton)
        
        $0.distribution = .equalSpacing
        
    }
    
    lazy var infoButton = NormalButton(text: "영화정보")
    lazy var selectButton = NormalButton(text: "영화선택")
    
    //MARK: Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        setUI()
    }
    
    //MARK: Custom Method
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(headerLine,infoStackview,footerLine)
    }
    
    private func setConstraints() {
        infoStackview.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(114)
        }
        
        posterImageView.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(100)
        }
        
        [infoButton,selectButton].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(60)
            }
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        headerLine.snp.makeConstraints {
            $0.bottom.equalTo(infoStackview.snp.top)
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(4)
        }
        
        footerLine.snp.makeConstraints {
            $0.top.equalTo(infoStackview.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(4)
        }
        
    }
}
