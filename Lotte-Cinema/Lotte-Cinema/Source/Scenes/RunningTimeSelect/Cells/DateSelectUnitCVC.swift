//
//  DateSelectUnitCVC.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/19.
//

import UIKit

class DateSelectUnitCVC: UICollectionViewCell {
    
    enum Weekday: String {
        case mon,tue,wed,thu,fri = "평일"
        case sat = "토"
        case sun = "일"
    }
    
    
    private let dateLabel = UILabel().then {
        $0.font = .RobotoMedium(ofSize: 16)
    }
    
    private let weekDayLabel = UILabel().then {
        $0.font = .NotoSansRegular(ofSize: 12)
    }
    
    private lazy var dateStackView = UIStackView().then {
        $0.addArrangeSubviews(dateLabel,weekDayLabel)
        $0.axis = .vertical
        $0.alignment = .center
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
        self.contentView.addSubview(dateStackView)
    }
    
    private func setConstraints() {
        dateStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        self.makeCornerRound(radius: 4)
        self.backgroundColor = .white
        self.makeBorder(width: 1, color: .g_100)
    }
    
    func configure(date: String, weekDay: String){
        dateLabel.text = date
        weekDayLabel.text = weekDay
    }
    
    func configureSelection(isSelected: Bool) {
        if isSelected {
            self.setGradient(color1: .main_1, color2: .main_2)
        } else {
            self.backgroundColor = .white
            if let gradientLayer = self.layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
                gradientLayer.removeFromSuperlayer()
            }
        }
        dateLabel.textColor = isSelected ? .white : .black
        weekDayLabel.textColor = isSelected ? .white : .black
    }
}

extension DateSelectUnitCVC: CollectionViewCellReuseProtocol {
    
}
