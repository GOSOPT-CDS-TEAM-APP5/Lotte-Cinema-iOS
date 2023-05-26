//
//  LineFooterView.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/19.
//

import UIKit

final class LineFooterView: UICollectionReusableView {
    //MARK: Property
    static let identifier = "lineFooterView"
    
    //MARK: Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .g_100
    }
}

