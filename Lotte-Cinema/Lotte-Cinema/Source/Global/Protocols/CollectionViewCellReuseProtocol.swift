
//  CollectionViewCellReuseProtocol.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//
//

import UIKit

protocol CollectionViaewCellReuseProtocol where Self: UICollectionViewCell {
    static func register(collectionView: UICollectionView)
    static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self
    static var reuseIdentifier: String { get }
}

extension CollectionViaewCellReuseProtocol {
    static func register(collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? Self else { fatalError()}
        return cell
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
