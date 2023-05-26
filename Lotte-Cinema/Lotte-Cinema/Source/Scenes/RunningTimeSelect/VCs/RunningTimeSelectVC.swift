//
//  RunningTimeSelectVC.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/18.
//



import UIKit
import SnapKit
import Then

final class RunningTimeSelectVC : UIViewController {
    
    
    //MARK: Property
    let baseURL = Config.baseURL
    let theaterString: [String] = ["홍대입구","브로드웨이(신사)","서울대입구서울대입구역샤로수길"]
    private var selectedDateIndex: Int = 1
    var dateIndex = 0
    let date = [7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    let weekday: [String] = ["일","월","화","수","목","금","토","일","월","화","수","목","금","토"]
    
    var multiplexList: [MultiplexList] = []
    var theaterList : Response?
    
    
    
    //MARK: UI Component
    private lazy var runningTimeSelectView = RunningTimeSelectView()
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo(date: "2023-05-08", movieId: 1, theaterIds: [13,9,10])
        setLayout()
    }
    func setLayout(){
        view.addSubview(runningTimeSelectView)
        runningTimeSelectView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    //MARK: Custom Method
    private func setdelegate() {
        runningTimeSelectView.collectionView.dataSource = self
        runningTimeSelectView.collectionView.delegate = self
        runningTimeSelectView.collectionView.collectionViewLayout = runningTimeSelectView.createLayout()
    }
    
    private func getInfo(date: String, movieId: Int, theaterIds: [Int]) {
        let url = "\(baseURL)schedule?date=\(date)&movieId=\(movieId)"
        print(url)
        var theaterIdParameters = ""
        for theaterId in theaterIds {
            theaterIdParameters += "&theaterId=\(theaterId)"
        }
        GetService.shared.getService(from: url+theaterIdParameters,
                                     isTokenUse: false) {
            (data: Response?, error) in
            guard let data = data else {
                print("error: \(String(describing: error?.debugDescription))")
                return
            }
            self.theaterList = data
            self.runningTimeSelectView.theaterList = data
            self.setdelegate()
            self.runningTimeSelectView.collectionView.reloadData()
            print(data)
        }
    }
    private func updateRunningTimeData(dateIndex: Int) {
        guard let theaterList = theaterList else {
            return
        }
        let selectedDate = date[dateIndex]
        let dateString: String = selectedDate >= 10 ? String(selectedDate) : "0\(selectedDate)"
        let dateParam = "2023-05-\(dateString)"
        
        getInfo(date: dateParam, movieId: 1, theaterIds: [13,9,10])
    }
}

//MARK: extension - DataSource
extension RunningTimeSelectVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (theaterList?.data.count ?? 0) + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return theaterList?.data.count ?? 0
        case 1:
            return weekday.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            let cell = TheaterUnitCVC.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configure(name: theaterList?.data[indexPath.item].theaterName)
            return cell
        case 1:
            let cell = DateSelectUnitCVC.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureSelection(isSelected: false)
            cell.configure(
                date: String(date[indexPath.item]),
                weekDay: weekday[indexPath.item])
            if indexPath.item == selectedDateIndex {
                cell.configureSelection(isSelected: true)
            } else {
                cell.configureSelection(isSelected: false)
            }
            
            return cell
        case 2...(theaterList?.data.count)!+2:
            let cell = TimeSelectCVC.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.index = indexPath.section - 2
            cell.theaterInfo = theaterList?.data
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: MovieHeaderView.identifier,
                for: indexPath
            ) as? MovieHeaderView else {
                return UICollectionReusableView()
            }
            return header
        } else if kind == "TheaterSelButton" {
            let buttonView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TheaterSelButton", for: indexPath) as! TheaterSelectButtonView
            return buttonView} else {
                // Dequeue reusable supplementary view for footer
                guard let footer = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: LineFooterView.identifier,
                    for: indexPath
                ) as? LineFooterView else {
                    return UICollectionReusableView()
                }
                return footer
            }
    }
}

//MARK: extension - delegate
extension RunningTimeSelectVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        // 이전에 선택된 셀을 해제
        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
            for selectedIndexPath in selectedIndexPaths {
                collectionView.deselectItem(at: selectedIndexPath, animated: false)
                if let cell = collectionView.cellForItem(at: selectedIndexPath) as? DateSelectUnitCVC {                    cell.configureSelection(isSelected: false)
                    
                }
            }
        }
        
        // 선택된 셀의 색상을 변경
        if let cell = collectionView.cellForItem(at: indexPath) as? DateSelectUnitCVC {
            cell.configureSelection(isSelected: true)
        }
        
        // 첫 번째 섹션의 셀만 선택하도록 수정
        if indexPath.section == 1 {
            selectedDateIndex = indexPath.item
            updateRunningTimeData(dateIndex: selectedDateIndex)
        }
        collectionView.reloadData()
        return true
    }
}



