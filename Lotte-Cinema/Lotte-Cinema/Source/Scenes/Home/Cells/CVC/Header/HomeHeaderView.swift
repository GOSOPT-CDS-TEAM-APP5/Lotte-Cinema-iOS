//
//  HomeHeaderView.swift
//  Lotte-Cinema
//
//  Created by 고영민 on 2023/06/07.
//

import UIKit
import SnapKit
import Then

enum HomeCellType {
    case moviechart
    case event
    case moviefeed
    case specialroom
}

class HomeHeaderView: UICollectionReusableView {
    static let identififer: String = "HomeHeaderView"
    
    private let titleLabel = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 20)
        $0.textColor = .black
    }
    
    private let categoriLabel1 = UILabel().then {
        $0.font = .NotoSansLight(ofSize: 16)
        $0.textColor = .g_400
    }
    private let categoriLabel2 = UILabel().then {
        $0.font = .NotoSansLight(ofSize: 16)
        $0.textColor = .g_400
    }
    private let categoriLabel3 = UILabel().then {
        $0.font = .NotoSansLight(ofSize: 16)
        $0.textColor = .g_400
    }
    
    private let expandButton = UIButton().then {
        $0.backgroundColor = .clear
        var config = UIButton.Configuration.plain()
        config.image = ImageLiterals.icExpand
        config.imagePlacement = .trailing
        config.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.attributedTitle = AttributedString("펼쳐보기".setAttributeString(range: .init(location: 0, length: "펼쳐보기".count),
                                                                            font: .NotoSansMedium(ofSize: 10),
                                                                            textColor: .g_400))
        $0.configuration = config
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func bindHeader(type: HomeCellType,
                             rowCount: Int = 0) {
        DispatchQueue.main.async {
            self.addSubview(self.titleLabel)
            self.titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(16)
                $0.leading.equalToSuperview().offset(16)
            }
            
            switch type {
            case .moviechart:
                self.backgroundColor = .white
                self.titleLabel.text = "무비차트"
                self.titleLabel.textColor = .black
                //카테고리추가 +++++++++++
                self.categoriLabel1.text = "무비싸다구"
                self.categoriLabel2.text = "롯시플"
                self.categoriLabel3.text = "롯시무비"
                self.addSubviews(self.categoriLabel1, self.categoriLabel2, self.categoriLabel3)
                self.categoriLabel1.snp.makeConstraints {
                    $0.leading.equalTo(self.titleLabel.snp.trailing).offset(8)
                }
                self.categoriLabel2.snp.makeConstraints {
                    $0.leading.equalTo(self.categoriLabel1.snp.trailing).offset(8)
                }
                self.categoriLabel3.snp.makeConstraints {
                    $0.leading.equalTo(self.categoriLabel2.snp.trailing).offset(8)
                }
                
            case .event:
                self.backgroundColor = .white
                self.titleLabel.text = "이벤트"
                self.titleLabel.textColor = .black
                self.addSubview(self.expandButton)
                self.expandButton.snp.makeConstraints {
                    $0.trailing.equalToSuperview().inset(16)
                    $0.centerY.equalTo(self.titleLabel)
                    $0.width.equalTo(60)
                }
                
            case .moviefeed:
                self.backgroundColor = .white
                self.titleLabel.text = "무비피드"
                self.titleLabel.textColor = .black
                
            case .specialroom:
                self.backgroundColor = .white
                self.titleLabel.text = "스폐셜룸"
                self.titleLabel.textColor = .black
                self.addSubview(self.expandButton)
                self.expandButton.snp.makeConstraints {
                    $0.trailing.equalToSuperview().inset(16)
                    $0.centerY.equalTo(self.titleLabel)
                    $0.width.equalTo(60)
                }
            }
        }
    }
}


