import UIKit

class MovieInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    //MARK: - Configuration
    private func setTableViewConfig() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let headerView = InfoTableViewHeader()
        self.tableView.tableHeaderView = headerView
    }
    
    //MARK: - Layout
    private func setLayout() {
        self.view.backgroundColor = .red
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubviews(tableView, navigationView)
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
        }
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Components
    private let navigationView = MovieInfoNavigationView()
    private let tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .black
        $0.contentInsetAdjustmentBehavior = .never
    }

}

extension MovieInfoVC: UITableViewDelegate {}
extension MovieInfoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
