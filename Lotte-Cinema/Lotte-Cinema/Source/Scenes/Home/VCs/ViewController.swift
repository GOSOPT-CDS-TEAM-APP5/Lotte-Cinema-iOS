////
////  ViewController.swift
////  Lotte-Cinema
////
////  Created by 고영민 on 2023/05/13.
////
//
//import UIKit
//
//final class ViewController: BaseVC {
//
//    private let rootView = HashtagLottecinemaCVC()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        view.backgroundColor = .red
//        render()
//        setStyle()
//    }
//     func setStyle() {
//
//            rootView.do {
//                $0.register(HashtagLottecinemaCVC.self, forCellWithReuseIdentifier: HashtagLottecinemaCVC.identifier)
//                $0.showsVerticalScrollIndicator = false
//            }
//    }
//    func render() {
//        self.view = HashtagLottecinemaCVC()
//    }
//    override func setLayout() {
//           
//           view.addSubview(rootView)
//           
//        rootView.snp.makeConstraints {
//               $0.top.equalTo(view.safeAreaInsets)
//               $0.leading.trailing.bottom.equalToSuperview()
//           }
//       }
//
//}
