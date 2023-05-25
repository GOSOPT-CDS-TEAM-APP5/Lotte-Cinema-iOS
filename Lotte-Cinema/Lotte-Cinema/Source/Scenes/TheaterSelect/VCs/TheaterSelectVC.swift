import UIKit
import SnapKit
import Then

final class TheaterSelectVC: UIViewController {
    var regionData: [RegionData]?
    var theaterData: [TheaterListData]?
    var selectedTheater: [TheaterListData] = []
    var selectedIndex: [Int] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getRegionData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.setLayout()
        self.setTableViewConfig()
        self.setCollectionViewConfig()
    }
    
    private func setTableViewConfig() {
        self.regionTableView.delegate = self
        self.theaterTableView.delegate = self
        self.regionTableView.dataSource = self
        self.theaterTableView.dataSource = self
        self.regionTableView.register(TheaterCategoryTVC.self,
                                forCellReuseIdentifier: TheaterCategoryTVC.identifier)
        self.theaterTableView.register(TheaterNameTVC.self,
                                forCellReuseIdentifier: TheaterNameTVC.identifier)
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(SelectedTheaterCVC.self,
                                     forCellWithReuseIdentifier: SelectedTheaterCVC.identifier)
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = .init(width: 100, height: 60)
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = .init(top: 0, left: 8, bottom: 0, right: 0)
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubviews(navigationView, regionTableView, theaterTableView, collectionView, completeButton, changeTheaterButton)
        self.navigationView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(7)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.navigationView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
        }
        self.changeTheaterButton.snp.makeConstraints {
            $0.top.equalTo(self.collectionView.snp.top)
            $0.bottom.equalTo(self.collectionView.snp.bottom)
            $0.trailing.equalTo(self.collectionView.snp.trailing)
            $0.width.equalTo(61)
        }
        self.changeTheaterButton.isHidden = true
        self.regionTableView.snp.makeConstraints {
            $0.top.equalTo(self.collectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.bottom.equalTo(self.completeButton.snp.top)
        }
        self.theaterTableView.snp.makeConstraints {
            $0.top.equalTo(self.collectionView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.bottom.equalTo(self.completeButton.snp.top)
        }
        self.theaterTableView.isHidden = true
        self.completeButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        self.navigationView.backButtonTappCompletion = { [weak self] in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: - Network
    private func getRegionData() {
        GetService.shared.getService(from: Constants.baseURL + "/region",
                                     isTokenUse: false) {
            (data: RegionDataModel?, error) in
            guard let data = data else {
                print("error: \(error?.debugDescription)")
                return
            }
            self.regionData = data.data
            self.regionTableView.reloadData()
            
        }
    }
    
    private func getTheaterData(theaterId: Int) {
        GetService.shared.getService(from: Constants.baseURL + "/theater?regionId=\(theaterId)",
                                     isTokenUse: false) {
            (data: TheaterListDataModel?, error) in
            guard let data = data else {
                print("error: \(error?.debugDescription)")
                self.theaterData = []
                self.theaterTableView.reloadData()
                return
            }
            self.theaterData = data.data
            self.theaterTableView.reloadData()
            self.theaterTableView.isHidden = false
        }
    }
    
    @objc private func didCompleteButtonTapped() {
        //여기서 선택된 항목 넘ㄱ며주면 되는데.. 위의 배열보면 어떤값 넘겨야 되는지 알 수 있어
        //selectedTheater 배열이 선택된 영화관 값이야!!
        //이걸루 푸쉬해서 넘겨준다음 서버 붙히면 될듯!!
    }
    
    private let navigationView = TheaterSelectNavigationView()
    private let regionTableView = UITableView(frame: .zero, style: .plain).then {
        $0.separatorStyle = .none
        $0.backgroundColor = .white
    }
    private let theaterTableView = UITableView(frame: .zero, style: .plain).then {
        $0.separatorStyle = .none
        $0.backgroundColor = .white
    }
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.alwaysBounceHorizontal = true
        $0.backgroundColor = .g_100
    }
    private lazy var changeTheaterButton = UIButton().then {
        $0.backgroundColor = .g_100
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.NotoSansRegular(ofSize: 10),
            .foregroundColor: UIColor.g_400
        ]
        let attributedString = NSAttributedString(string: "영화관변경", attributes: attributes)
        $0.setAttributedTitle(attributedString, for: .normal)
    }
    private lazy var completeButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(didCompleteButtonTapped),
                     for: .touchUpInside)
        $0.backgroundColor = .g_200
        $0.setTitle("선택 완료", for: .normal)
        $0.titleLabel?.font = .NotoSansRegular(ofSize: 14)
    }
}

extension TheaterSelectVC: UITableViewDelegate {}
extension TheaterSelectVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.regionTableView:
            return self.regionData?.count ?? 0
            
        case self.theaterTableView:
            return self.theaterData?.count ?? 0
            
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case self.regionTableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategoryTVC.identifier) as? TheaterCategoryTVC else {return UITableViewCell()}
            if let data = regionData {
                cell.bindText(title: data[indexPath.row].regionName, seatCount: data[indexPath.row].theaterCount)
            }
            return cell
            
        case self.theaterTableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TheaterNameTVC.identifier) as? TheaterNameTVC else {return UITableViewCell()}
            if let data = theaterData {
                cell.bindText(title: data[indexPath.row].theaterName)
            }
            return cell
            
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case self.regionTableView:
            tableView.visibleCells.forEach {
                let cell = $0 as? TheaterCategoryTVC
                cell?.changeBackgroundColor()
            }
            if let cell = tableView.cellForRow(at: indexPath) as? TheaterCategoryTVC {
                cell.isSelected.toggle()
                cell.changeBackgroundColor()
            }
            if let data = regionData {
                self.getTheaterData(theaterId: data[indexPath.row].regionID)
            }
        case self.theaterTableView:
            var index = 0
            tableView.visibleCells.forEach {
                let cell = $0 as? TheaterNameTVC
                if let data = theaterData {
                    if data[index].theaterID != data[index].theaterID {
                        cell?.changeBackgroundColor()
                    }
                }
                index += 1
            }
            if let cell = tableView.cellForRow(at: indexPath) as? TheaterNameTVC {
                if let data = theaterData {
                    if self.selectedTheater.count < 3{
                        cell.isSelected.toggle()
                        cell.changeBackgroundColor()
                    }
                }
            }
            if let data = theaterData {
                if self.selectedTheater.count < 3 {
                    //중복검사
                    let list = TheaterListData(theaterID: data[indexPath.row].theaterID,
                                    theaterName: data[indexPath.row].theaterName)
                    if !selectedIndex.contains(indexPath.row) {
                        self.selectedTheater.append(data[indexPath.row])
                        self.selectedIndex.append(indexPath.row)
                        self.collectionView.insertItems(at: [[0, self.selectedTheater.count - 1]])
                    }
                    
                    DispatchQueue.main.async {
                        if self.selectedTheater.count > 0 {
                            self.changeTheaterButton.isHidden = false
                            self.completeButton.setGradient(color1: .main_1, color2: .main_2)
                        }
                    }
                }
            }
        default: break
        }
    }
    
}
extension TheaterSelectVC: UICollectionViewDelegate {}
extension TheaterSelectVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedTheater.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedTheaterCVC.identifier, for: indexPath) as? SelectedTheaterCVC else {return UICollectionViewCell()}
        cell.bindText(title: selectedTheater[indexPath.row].theaterName)
        return cell
    }
    
    
}
