//
//  PosterCVC.swift
//  Lotte-Cinema
//
//  Created by 박익범 on 2023/05/24.
//

import UIKit

class PosterCVC: UICollectionViewCell {
    static let identifier: String = "PosterCVC"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    internal func bindImage(image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
            self.contentView.backgroundColor = .black
            self.contentView.addSubview(self.imageView)
            self.imageView.snp.makeConstraints {
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
        }
        
    }
    
    private let imageView = UIImageView()
    
}
