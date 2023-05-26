//
//  TableViewCellProtocol.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//

import UIKit

import UIKit

protocol TableViewCellReuseProtocol {
    static var reuseIdentifier: String { get }
}

extension TableViewCellReuseProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: TableViewCellReuseProtocol {}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable Dequeue Reusable")
        }
        return cell
    }
}
