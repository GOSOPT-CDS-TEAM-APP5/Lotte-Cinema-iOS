//
//  TimeSelectCVC.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/19.
//

import UIKit
import SnapKit
import Then

class TimeSelectCVC: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    //MARK: Property
    lazy var theaterInfo: TheaterResponse = TheaterResponse(theaterName: "", multiplexList: cinemaList) {
        didSet {
            self.theaterLabel.text = theaterInfo.theaterName
        }
    }
    var cinemaList: [MultiplexList] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: UI Components
    let headerView = TheaterHeaderView()
    
    lazy var starButton = UIButton().then{
        $0.setImage(UIImage.load(name: "ic_star"), for: .normal)
    }
    
    let theaterLabel = UILabel().then{
        $0.font = .NotoSansRegular(ofSize: 16)
    }
    
    lazy var titleStackView = UIStackView().then {
        $0.alignment = .leading
        $0.spacing = 8
        $0.addArrangeSubviews(starButton,theaterLabel)
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout()).then{
        TimeCVC.register(collectionView: $0)
        $0.dataSource = self
        $0.backgroundColor = .g_50
        $0.showsHorizontalScrollIndicator = false
        $0.register(TheaterHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TheaterHeaderView.identifier)
    }
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .g_50
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
        theaterLabel.text = theaterInfo.theaterName
        contentView.addSubviews(titleStackView,collectionView)
    }
    
    private func setConstraints() {
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.bottom.equalToSuperview()
        }
    }
}

//MARK: extension - DataSource
extension TimeSelectCVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cinemaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cinemaList[section].scheduleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TimeCVC.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.configure(startTime: cinemaList[indexPath.section].scheduleList[indexPath.row].startTime,
                       endTime: cinemaList[indexPath.section].scheduleList[indexPath.row].endTime,
                       valid: cinemaList[indexPath.section].scheduleList[indexPath.row].currentPeople,
                       book: cinemaList[indexPath.section].scheduleList[indexPath.row].maxPeople)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: TheaterHeaderView.identifier,
            for: indexPath
        ) as? TheaterHeaderView else {
            return UICollectionReusableView()
        }
        header.configureCell(movieType: theaterInfo.multiplexList[indexPath.section].movieType, theater:theaterInfo.multiplexList[indexPath.section].multiplexLocation)
        return header
    }
}

//MARK: extension - Layout
extension TimeSelectCVC {
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            guard self != nil else { return nil }
            
            let section: NSCollectionLayoutSection
            //header 영역
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(30)
            )
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            //cell 설정
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .absolute(90),
                heightDimension: .absolute(60)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(8), top: .fixed(21), trailing: nil, bottom: .fixed(21))
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(90)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
            
            
            section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            section.boundarySupplementaryItems = [header]
            
            return section
        }
        return layout
    }
}
