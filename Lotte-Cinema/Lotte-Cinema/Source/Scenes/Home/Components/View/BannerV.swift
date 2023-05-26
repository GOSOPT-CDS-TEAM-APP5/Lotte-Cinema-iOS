////
////  HomeView.swift
////  iOS
////
////  Created by 고영민 on 2023/05/21.
////
//
//import UIKit
//import SnapKit
//import Then
//
//final class BannerV : UIView {
//    //headerPoster, logophoto, iconTicket ,icon_popcorn
//
//    //MARK: - UI Components
//
//    private let squareView = UIView().then {
//        $0.backgroundColor = UIColor.white
//    }
//
//    private let posterImg = UIImageView().then {
//        $0.image = .headerPoster
//    }
//
//    private let lotteImg = UIImageView().then {
//        $0.image = .logophoto
//    }
//
//    private let ticket_shake = UIButton().then {
//        $0.setTitle("흔들면 티켓이!", for: .normal)
//        $0.setTitleColor(UIColor.white, for: .normal)
//        $0.backgroundColor = .white
//        //$0.makeCornerRadius(ratio: 5)
//        $0.titleLabel?.font = .NotoSansBold(ofSize: 12)
//    }
//
//    private let ticketIcon = UIImageView().then {
//        $0.image = .icon_ticket
//    }
//
//    private let popcornIcon = UIImageView().then {
//        $0.image = .icon_popcorn
//    }
//
//    //MARK: - Life Cycles
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        style()
//        hierarchy()
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    //MARK: - Custom Method
//
//    private func style() {
//        self.backgroundColor = .white
//    }
//
//    private func hierarchy() {
//        self.addSubviews(
//            squareView
//        )
//        squareView.addSubviews(
//            posterImg, lotteImg, ticket_shake, ticketIcon, popcornIcon
//        )
//    }
//    //headerPoster, logophoto, iconTicket ,icon_popcorn
//
//    private func layout() {
//        squareView.snp.makeConstraints {
//            $0.width.equalTo(375)
//            $0.height.equalTo(251)
//            $0.centerX.centerY.equalToSuperview()
//        }
//        posterImg.snp.makeConstraints {
//            $0.width.height.equalTo(squareView)
//        }
//
//        lotteImg.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(8)
//            $0.top.equalToSuperview().offset(8)
//        }
//        ticket_shake.snp.makeConstraints {
//            $0.trailing.equalToSuperview().inset(85)
//            $0.top.equalToSuperview().inset(11)
//        }
//        ticketIcon.snp.makeConstraints {
//            $0.trailing.equalToSuperview().inset(51)
//            $0.top.equalToSuperview().inset(8)
//
//        }
//        ticketIcon.snp.makeConstraints {
//            $0.trailing.equalToSuperview().inset(20)
//            $0.top.equalToSuperview().inset(15)
//        }
//    }
//}
//
