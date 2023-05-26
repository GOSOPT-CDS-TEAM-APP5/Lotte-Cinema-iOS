//
//  TimeCVC.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/19.
//

import UIKit
import SnapKit

class TimeCVC: UICollectionViewCell {
    
    //MARK: UI Components
    let headerView = TheaterHeaderView()
    
    let startTimeLabel = UILabel().then {
        $0.font = .RobotoMedium(ofSize: 16)
    }
    
    let endTimeLabel = UILabel().then {
        $0.font = .RobotoMedium(ofSize: 10)
        $0.textColor = .g_100
        $0.text = "~"
    }
    
    let validSeatLabel = UILabel().then {
        $0.font = .RobotoMedium(ofSize: 10)
        $0.textColor = .sm_green
    }
    
    let bookSeatLabel = UILabel().then {
        $0.font = .RobotoMedium(ofSize: 10)
        $0.textColor = .g_400
        $0.text = "/"
    }
    
    lazy var timeStackView = UIStackView().then {
        $0.addArrangeSubviews(startTimeLabel,endTimeLabel)
    }
    
    lazy var seatStackView = UIStackView().then {
        $0.addArrangeSubviews(validSeatLabel,bookSeatLabel)
    }
    
    let topView = UIView()
    let bottomView = UIView()
    
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
        contentView.addSubviews(topView,bottomView)
        contentView.makeBorder(width: 1, color: .g_100)
        contentView.makeCornerRound(radius: 5)
        contentView.backgroundColor = .white
        
        topView.addSubview(timeStackView)
        bottomView.addSubview(seatStackView)
        
        bottomView.backgroundColor = .g_100
    }
    
    private func setConstraints() {
        topView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }
        bottomView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        [timeStackView, seatStackView].forEach { view in
            view.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
    }
    
    func configure(startTime: String, endTime: String, valid: String, book: String ) {
        startTimeLabel.text = startTime
        endTimeLabel.text = "~\(endTime)"
        validSeatLabel.text = valid
        bookSeatLabel.text = "/\(book)"
    }
}

extension TimeCVC: CollectionViewCellReuseProtocol{
    
}
