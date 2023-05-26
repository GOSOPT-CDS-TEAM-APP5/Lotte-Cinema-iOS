//
//  TheatherSelectButtonView.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/24.
//
import UIKit

final class TheaterSelectButtonView: UICollectionReusableView {
    
    
    private let selectTheaterButton = UIButton().then {
        $0.setTitle("영화관 선택", for: .normal)
        $0.titleLabel?.font = .NotoSansRegular(ofSize: 10)
        $0.setTitleColor(UIColor.g_400, for: .normal)
        $0.setUnderline()
        $0.backgroundColor = .white
    }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
      self.backgroundColor = .white
      addSubviews(selectTheaterButton)
      selectTheaterButton.snp.makeConstraints {
          $0.center.equalToSuperview()
      }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
}
