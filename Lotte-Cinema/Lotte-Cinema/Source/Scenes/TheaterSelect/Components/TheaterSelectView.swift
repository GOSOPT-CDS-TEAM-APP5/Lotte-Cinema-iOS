//
//  TheaterSelectView.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//

import UIKit
import SnapKit
import Then

class TheaterSelectView: UIView {
    
    private lazy var tableView = UITableView()
    
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
    }
    
    private func setConstraints() {
        
    }
}
