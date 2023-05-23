//
//  bannerCell.swift
//  Lotte-Cinema
//
//  Created by 고영민 on 2023/05/20.
//

import UIKit
import SnapKit
import Then


final class Banner: UICollectionViewCell {
    
    private let BannerimageView = UIImageView().then {
        $0.image = .headerPoster
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    private func setLayout(){
        self.addSubview(BannerimageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
