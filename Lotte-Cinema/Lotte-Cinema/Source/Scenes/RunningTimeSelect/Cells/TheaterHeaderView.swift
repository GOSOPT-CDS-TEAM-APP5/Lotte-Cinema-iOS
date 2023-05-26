//
//  TheaterHeaderView.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/20.
//

import UIKit
import Then
import SnapKit

final class TheaterHeaderView: UICollectionReusableView {
    
    //MARK: Property
    static let identifier = "theaterHeaderView"
    
    //MARK: UI Components
    private let movieTypeLabel = UILabel().then{
        $0.font = .NotoSansRegular(ofSize: 12)
    }
    
    private let theaterLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 12)
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
        self.addSubviews(movieTypeLabel,theaterLabel)
    }
    
    private func setConstraints() {
        movieTypeLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(17)
        }
        theaterLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(17)
        }
    }
    
    func configureCell(movieType: String, theater: String){
        movieTypeLabel.text = movieType
        theaterLabel.text = theater
    }
}
