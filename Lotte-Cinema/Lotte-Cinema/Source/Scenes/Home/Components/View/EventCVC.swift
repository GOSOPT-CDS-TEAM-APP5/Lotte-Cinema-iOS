//
//  Event.swift
//  Lotte-Cinema
//
//  Created by 고영민 on 2023/05/20.
//

import UIKit
import SnapKit
import Then


final class Banner: UICollectionViewCell {
    
    private let imageView = UIImageView().then {
        $0.image = .headerPoster
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    private func setLayout(){
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
