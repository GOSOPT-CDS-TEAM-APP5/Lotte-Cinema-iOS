import UIKit
import Then
import SnapKit


final class MovieChartView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView2 = CustomView2(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 200))
        
        view.addSubview(customView2)
    }
}




class CustomView2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#function)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
        loadView()
    }
    
    private func loadView() {
        let purpleView = makeView()
        purpleView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 30)
        addSubview(purpleView)
        
        let label = makeLabel()
        label.frame = CGRect(x: 0, y: 50, width: bounds.width, height: 20)
        addSubview(label)
    }
    
    private func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.text = "커스텀2"
        label.textAlignment = .center
        return label
    }
}
