import UIKit


class TabbarVC: UITabBarController {
    
    static let identifier = "TabbarVC"
    public var tabs: [UIViewController] = []
    private var comeBackIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
        self.setBackgroundColor()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedViewController = tabs[comeBackIndex]
    }
    func setBackgroundColor() {
        tabBar.isTranslucent = false
        self.view.backgroundColor = .white
    }
    
    
    override func viewDidLayoutSubviews() {
        let tabbarY = UIScreen.main.bounds.height
        let tabbarX = UIScreen.main.bounds.width
        var tabbarHeight = 86.0
        let frame = CGRect(x: 0,
                                  y: tabbarY - tabbarHeight,
                                  width: tabbarX,
                                  height: tabbarHeight)
        self.tabBar.frame = frame
    }
    
    private func configTabbar() {
        self.view.tintColor = .black
        self.view.backgroundColor = UIColor.white

        let homeVC = ViewController()
        let homeTab = UINavigationController(rootViewController: homeVC)
        homeTab.tabBarItem = UITabBarItem(title: "바로팝콘", image: ImageLiterals.iconPopcorn,
                                          selectedImage: ImageLiterals.iconPopcorn)
        
        
        let eventVC = EventVC()
        let eventTab = UINavigationController(rootViewController: eventVC)
        eventTab.tabBarItem = UITabBarItem(title: "이벤트", image: ImageLiterals.iconEvent,
                                            selectedImage: ImageLiterals.iconEvent)
        
        
        let ticketingVC = TicketingVC()
        let ticketingTab = UINavigationController(rootViewController: ticketingVC)
        ticketingTab.tabBarItem = UITabBarItem(title: "바로 예매",
                                            image: ImageLiterals.iconTicket,
                                            selectedImage: ImageLiterals.iconTicket)
        ticketingTab.tabBarItem.imageInsets = UIEdgeInsets(top: -13, left: 0, bottom: 5, right: 0)
        
        let myPageVC = MyPageVC()
        let myPageTab = UINavigationController(rootViewController: myPageVC)
        myPageTab.tabBarItem = UITabBarItem(title: "마이",
                                            image: ImageLiterals.iconMypage,
                                            selectedImage: ImageLiterals.iconMypage)
        
        
        let menuVC = MyPageVC()
        let menuTab = UINavigationController(rootViewController: menuVC)
        menuTab.tabBarItem = UITabBarItem(title: "메뉴",
                                            image: ImageLiterals.iconMenu,
                                            selectedImage: ImageLiterals.iconMenu)
        
        
        tabs = [homeTab, eventTab, ticketingTab, myPageTab, menuTab]
        setViewControllers(tabs, animated: true)
        selectedViewController = homeTab
    }
    
}
