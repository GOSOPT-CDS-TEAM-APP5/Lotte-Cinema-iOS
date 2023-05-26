//
//  NormalButton.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//

import UIKit

class NormalButton: UIButton {
    
    //MARK:  Init 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    
    init(text: String, backgroundcolor: UIColor = .white, radius: CGFloat = 15, borderColor: UIColor = .g_100, borderSize: CGFloat  = 1){
        super.init(frame: .zero)
        setButtonStyle(text,backgroundcolor,radius,borderColor: borderColor,borderSize: borderSize)
    }
    
    private func setButtonStyle(_ text: String, _ backgroundcolor: UIColor = .white, _ radius: CGFloat = 10, borderColor: UIColor = .g_100, borderSize: CGFloat  = 1) {
        self.backgroundColor = backgroundcolor
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .NotoSansRegular(ofSize: 10)
        self.setTitleColor(.g_400, for: .normal)
        self.makeCornerRound(radius: radius)
        self.makeBorder(width: borderSize, color: borderColor)
    }

}
