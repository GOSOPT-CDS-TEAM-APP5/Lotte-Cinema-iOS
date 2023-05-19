//
//  UIStackView+.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//
import UIKit

extension UIStackView {
    func addArrangeSubviews(_ views: UIView...) {
            views.forEach { self.addArrangedSubview($0) }
        }
    
    func clearSubViews() {
        self.arrangedSubviews.forEach{
            self.removeArrangedSubview($0) //superview에서 view 삭제
            $0.removeFromSuperview() // 자식view에서도 superview 삭제
        }
    }
}
