//
//  Footer.swift
//  Lotte-Cinema
//
//  Created by 고영민 on 2023/05/20.
//

import UIKit
import SnapKit
import Then

final class HomeCollectionViewFooter : UICollectionReusableView {
    
    //MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - UI Components
    static let identifier: String = "HomeCollectionViewFooter"
    
    private let posterImg = UIImageView().then {
        $0.image = .photo_2
    }
    
    private let label1 = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 10)
        $0.textColor = .black
        $0.text = "공지사항"
    }
    
    private let label2 = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .main_1
        $0.text = "롯데시네마 월드타워관 이용 안내"
    }
    private let label3 = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 10)
        $0.textColor = .black
        $0.text = "이용약관"
    }
    
    private let label4 = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 10)
        $0.textColor = .main_1
        $0.text = "개인정보처리방침"
    }
    private let label5 = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 10)
        $0.textColor = .black
        $0.text = "고객센터"
    }
    private let slashLabel = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 10)
        $0.textColor = .g_200
        $0.text = "|"
    }
    private let slashLabel2 = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 10)
        $0.textColor = .g_200
        $0.text = "|"
    }
    private let slashLabel3 = UILabel().then {
        $0.font = .NotoSansBold(ofSize: 10)
        $0.textColor = .g_200
        $0.text = "|"
    }
    
    private let showallBtn = UIButton().then {
        $0.setTitle("전체보기 >", for: .normal)
        $0.setTitleColor(UIColor.g_400, for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = .NotoSansBold(ofSize: 12)
    }
    
    //MARK: - Custom Method
    func setLayout() {
        self.addSubviews(posterImg,label1,label2,label3,label4,label5, slashLabel, showallBtn)
        
        self.label1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        self.posterImg.snp.makeConstraints {
            $0.top.equalTo(label1).offset(12)
            $0.leading.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(124)
        }
        self.label2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        self.slashLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(label1).offset(14)
        }
        self.label2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(label1).offset(14)
        }
        self.showallBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.trailing.equalTo(label1).offset(26)
        }
        self.label3.snp.makeConstraints {
            $0.top.equalTo(posterImg.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(89.5)
        }
        self.slashLabel2.snp.makeConstraints {
            $0.top.equalTo(posterImg.snp.bottom).offset(35)
            $0.leading.equalTo(label3).offset(12)
        }
        self.label4.snp.makeConstraints {
            $0.top.equalTo(posterImg.snp.bottom).offset(32)
            $0.leading.equalTo(slashLabel).offset(12)
        }
        self.slashLabel3.snp.makeConstraints {
            $0.leading.equalTo(label4).offset(12)
            $0.top.equalTo(posterImg.snp.bottom).offset(35)
        }
        self.label5.snp.makeConstraints {
            $0.top.equalTo(posterImg.snp.bottom).offset(32)
            $0.leading.equalTo(slashLabel).offset(12)
        }

        

    }
}
