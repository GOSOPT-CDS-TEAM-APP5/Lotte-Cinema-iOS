//
//  EmptyCVC.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/06/01.
//

import UIKit
import SnapKit
import Then

class EmptyCVC: UICollectionViewCell {
    private lazy var stackView = UIStackView().then {
        $0.addArrangeSubviews(imageView,emptyLabel)
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 16
    }
    private let imageView = UIImageView(image: .iconEmpty)
    private let emptyLabel = UILabel().then {
        $0.text = "상영 가능한 스케줄이 없습니다.\n다른 시간, 날짜, 영화관을 선택해 보세요."
        $0.font = .NotoSansRegular(ofSize: 14)
        $0.textColor = .g_400
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(stackView)
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension EmptyCVC: CollectionViewCellReuseProtocol {
    
}

