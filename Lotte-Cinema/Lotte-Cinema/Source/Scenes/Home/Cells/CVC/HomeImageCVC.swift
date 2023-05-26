//
//  HomeImageCVC.swift
//  Lotte-Cinema
//
//  Created by 박익범 on 2023/05/26.
//

import UIKit

class HomeImageCVC: UICollectionViewCell {
    static let identifier: String = "HomeImageCVC"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    internal func bindData(image: UIImage) {
        self.imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
}
