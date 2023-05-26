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
    let theaterString: [String] = ["홍대입구","브로드웨이(신사)","서울대입구서울대입구역샤로수길"]
    
    let date = [7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    let weekday: [String] = ["일","월","화","수","목","금","토","일","월","화","수","목","금","토"]
    
    lazy var theaterInfo: TheaterResponse = TheaterResponse(theaterName: "홍대입구", multiplexList: multiplexList)
    let multiplexList: [MultiplexList] = [MultiplexList(movieType: "2D", multiplexLocation: "2관", scheduleList: [ScheduleList(startTime: "13:00", endTime: "14:00", currentPeople: "130", maxPeople: "150")]),MultiplexList(movieType: "2D", multiplexLocation: "2관", scheduleList: [ScheduleList(startTime: "13:00", endTime: "14:00", currentPeople: "130", maxPeople: "150")])]
    
    lazy var theaterInfo2: TheaterResponse = TheaterResponse(theaterName: "브로드웨이(신사)", multiplexList: multiplexList2)
    let multiplexList2: [MultiplexList] = [MultiplexList(movieType: "2D", multiplexLocation: "2관", scheduleList: [ScheduleList(startTime: "13:00", endTime: "14:00", currentPeople: "130", maxPeople: "150"),ScheduleList(startTime: "15:00", endTime: "18:00", currentPeople: "130", maxPeople: "150"),ScheduleList(startTime: "19:00", endTime: "20:00", currentPeople: "130", maxPeople: "150")]),MultiplexList(movieType: "2D", multiplexLocation: "2관", scheduleList: [ScheduleList(startTime: "13:00", endTime: "14:00", currentPeople: "130", maxPeople: "150")]),MultiplexList(movieType: "2D", multiplexLocation: "2관", scheduleList: [ScheduleList(startTime: "13:00", endTime: "14:00", currentPeople: "130", maxPeople: "150")]),MultiplexList(movieType: "2D", multiplexLocation: "2관", scheduleList: [ScheduleList(startTime: "13:00", endTime: "14:00", currentPeople: "130", maxPeople: "150")])]
    
    lazy var theaterList : [TheaterResponse] = [theaterInfo,theaterInfo2]
    
    //MARK: UI Component
    private let runningTimeSelectView = RunningTimeSelectView()
    
    //MARK: LifeCycles
    override func loadView() {
        self.view = runningTimeSelectView
        setdelegate()
    }
    
    //MARK: Custom Method
    private func setdelegate() {
        runningTimeSelectView.collectionView.dataSource = self
        runningTimeSelectView.collectionView.delegate = self
        runningTimeSelectView.theaterList = self.theaterList
    }
}

//MARK: extension - DataSource
extension RunningTimeSelectVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 + theaterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return theaterString.count
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
            cell.configure(name: theaterString[indexPath.item])
            return cell
        case 1:
            let cell = DateSelectUnitCVC.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configure(
                date: String(date[indexPath.item]),
                weekDay: weekday[indexPath.item])
            return cell
        case 2:
            let cell = TimeSelectCVC.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.theaterInfo = theaterInfo
            print(theaterInfo)
            cell.cinemaList = theaterInfo.multiplexList
            return cell
        default:
            let cell = TimeSelectCVC.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.theaterInfo = theaterInfo2
            cell.cinemaList = theaterInfo2.multiplexList
            return cell
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
                if let cell = collectionView.cellForItem(at: selectedIndexPath) as? DateSelectUnitCVC {
                    cell.configureSelection(isSelected: false)
                }
            }
        }
        
        // 선택된 셀의 색상을 변경
        if let cell = collectionView.cellForItem(at: indexPath) as? DateSelectUnitCVC {
            cell.configureSelection(isSelected: true)
        }
        
        return true
    }
}

