//
//  bannerCell.swift
//  Lotte-Cinema
//
//  Created by 고영민 on 2023/05/20.
//

import UIKit
import SnapKit
import Then


final class BannerCVC: UICollectionViewCell {
    
    private let BannerimageView = UIImageView().then {
        $0.image = .headerPoster
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        self.addSubview(BannerimageView)
        BannerimageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
