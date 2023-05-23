//
//  MovieChart.swift
//  Lotte-Cinema
//
//  Created by 고영민 on 2023/05/20.
//

import UIKit
import SnapKit
import Then


final class MovieChart: UICollectionViewCell {
    
    private let moviechart1imageView = UIImageView().then {
        $0.image = .moviechart1
        
    }
    private let moviechart2imageView = UIImageView().then {
        $0.image = .moviechart2
    }
    private let moviechart3imageView = UIImageView().then {
        $0.image = .moviechart3
    }
    private let moviechart4imageView = UIImageView().then {
        $0.image = .moviechart_4
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        [moviechart1imageView, moviechart2imageView, moviechart3imageView, moviechart4imageView].forEach {
            self.contentView.addSubviews($0)
        }
        
        moviechart1imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        moviechart2imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        moviechart3imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        moviechart4imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
