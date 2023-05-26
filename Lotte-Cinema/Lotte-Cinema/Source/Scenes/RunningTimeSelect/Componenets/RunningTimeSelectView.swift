//
//  RunningTimeSelectView.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//

import UIKit
import SnapKit

final class RunningTimeSelectView: UIView {
    
    lazy var theaterList : [TheaterResponse] = []
    
    //MARK: UIComponents
    private let navigationView = NavigationView()
    let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    
    lazy var collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: createLayout()).then {
        $0.register(MovieHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieHeaderView.identifier)
        $0.register(LineFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LineFooterView.identifier)
        $0.register(TheaterSelectButtonView.self, forSupplementaryViewOfKind: "TheaterSelButton", withReuseIdentifier: "TheaterSelButton")
        TheaterUnitCVC.register(collectionView: $0)
        DateSelectUnitCVC.register(collectionView: $0)
        TimeSelectCVC.register(collectionView: $0)
        $0.allowsMultipleSelection = false
        
    }
    
    private let selectTheaterButton = UIButton().then {
        $0.setTitle("영화관 선택", for: .normal)
        $0.titleLabel?.font = .NotoSansRegular(ofSize: 10)
        $0.setTitleColor(UIColor.g_400, for: .normal)
        $0.setUnderline()
        $0.backgroundColor = .white
    }
    
    private let headerView = MovieHeaderView()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Custom Method
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.backgroundColor = .white
        self.addSubviews(navigationView,collectionView)
        buttonView.backgroundColor = .white
        buttonView.addSubview(selectTheaterButton)
    }
    
    private func setConstraints() {
        navigationView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(66)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

//MARK: extension - layout
extension RunningTimeSelectView {
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            guard self != nil else { return nil }
            
            let section: NSCollectionLayoutSection
            
            switch sectionIndex {
            case 0: // theater select
                
                //header 영역
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(130)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                //cell 설정
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .estimated(200),
                    heightDimension: .absolute(32)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(8), top: .fixed(21), trailing: nil, bottom: .fixed(21))
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.3),
                    heightDimension: .absolute(74)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
                
                
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                
                let footerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(1.0)
                )
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                
                
                let buttonSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(50))
                  let button = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: buttonSize,
                    elementKind: "TheaterSelButton",
                    alignment: .trailing
                  )
                  
                  section.boundarySupplementaryItems = [header, footer, button]
                
                
                
                
            case 1: // date select
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.15),
                    heightDimension: .absolute(81)
                )
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 16, leading: 8, bottom: 16, trailing: 8)
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                var footerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(1.0)
                )
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                
                section.boundarySupplementaryItems = [footer]
                
            default : // timeSelect section
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(CGFloat(max(140 * self!.theaterList[sectionIndex-2].multiplexList.count, 0)))
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, repeatingSubitem: item, count: 1)
                
                var footerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(4.0)
                )
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [footer]
                
            }
            
            return section
        }
        
        return layout
    }
}
