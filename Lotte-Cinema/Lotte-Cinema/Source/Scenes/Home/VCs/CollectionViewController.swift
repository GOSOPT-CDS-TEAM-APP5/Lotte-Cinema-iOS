////
////  CollectionViewController.swift
////  Lotte-Cinema
////
////  Created by 고영민 on 2023/05/26.
////
//
//import UIKit
//import Then
//import SnapKit
//
//private var MovieChartCollectionView = UICollectionView(frame: .zero,
//                                              collectionViewLayout: UICollectionViewFlowLayout())
//
//class CollectionViewController: UICollectionViewController {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//    }
//
//
//    func setStyle() {
//        
//        collectionView.do {
//            $0.register(MovieChartCell.self, forCellWithReuseIdentifier: MovieChartCell.identifier)
//            $0.showsVerticalScrollIndicator = false
//            $0.delegate = self
//            $0.dataSource = self
//        }
//    }
//    func setLayout() {
//
//        view.addSubview(MovieChartCollectionView)
//
//        MovieChartCollectionView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaInsets)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return struct.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
//
//        return cell
//    }
//
//
//}
//extension PhotoViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 3
//    }
//}
