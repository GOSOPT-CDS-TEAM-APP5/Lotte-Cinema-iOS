//
//  NavigationBarView.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/20.
//

import UIKit

final class NavigationView: UIView {
    //MARK: UI Component
    private let adImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 60)).then {
        $0.image = .load(name: "hyundai_card_photo")
    }
    lazy var backButton = UIButton().then {
        $0.setImage(ImageLiterals.icChevronLeft, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    //MARK: Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Custom Method
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(adImageView,backButton)
    }
    
    private func setConstraints() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(44)
        }
        adImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
}
