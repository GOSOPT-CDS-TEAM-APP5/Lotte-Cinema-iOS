//
//  TheaterUnitCVC.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//

import UIKit

class TheaterUnitCVC: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    //MARK: UI Components
    let theaterLabel = UILabel().then {
        $0.font = .NotoSansMedium(ofSize: 12)
        $0.textColor = .white
        $0.sizeToFit()
    }
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Custom Method
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        contentView.addSubview(theaterLabel)
        
        self.layoutIfNeeded()
        self.setGradient(color1: .main_1, color2: .main_2)
        self.makeCornerRound(radius: 16)
    }
    
    private func setConstraints() {
        theaterLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
    
    func configure(name: String?){
        theaterLabel.text = name
    }
}
