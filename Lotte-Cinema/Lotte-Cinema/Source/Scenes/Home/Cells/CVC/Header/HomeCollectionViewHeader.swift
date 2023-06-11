//
//  HomeView.swift
//  iOS
//
//  Created by 고영민 on 2023/05/21.
//

import UIKit
import SnapKit
import Then

class HomeCollectionViewHeader : UICollectionReusableView {

    //MARK: - UI Components
    static let identifier: String = "HomeCollectionViewHeader"
    
    private let contentView = UIView().then {
        $0.backgroundColor = .black
    }

    private let contentBackgroundView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let posterImg = UIImageView().then {
        $0.image = .headerPoster
    }

    private let lotteImg = UIImageView().then {
        $0.image = .logophoto
    }

    private let ticket_shake = UIButton().then {
        $0.setTitle("흔들면 티켓이!", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .white
        //$0.makeCornerRadius(ratio: 5)
        $0.titleLabel?.font = .NotoSansBold(ofSize: 12)
    }

    private let ticketIcon = UIImageView().then {
        $0.image = .icon_ticket
    }

    private let popcornIcon = UIImageView().then {
        $0.image = .icon_popcorn
    }

    //MARK: - Life Cycles
    init() {
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    //MARK: - Custom Method
    private func setLayout() {
        self.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.addSubviews(posterImg,lotteImg,ticket_shake,ticketIcon,popcornIcon)
        

        posterImg.snp.makeConstraints {
            $0.width.height.equalTo(contentView)
        }

        lotteImg.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(8)
        }
        ticket_shake.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(85)
            $0.top.equalToSuperview().inset(11)
        }
        ticketIcon.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(51)
            $0.top.equalToSuperview().inset(8)

        }
        ticketIcon.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(15)
        }
    }
}

