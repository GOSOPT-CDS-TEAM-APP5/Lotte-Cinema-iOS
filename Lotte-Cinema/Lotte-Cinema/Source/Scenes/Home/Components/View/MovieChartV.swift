//import UIKit
//import Then
//import SnapKit
//
//
//final class CustomView: UIView {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        print(#function)
//        loadView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        print(#function)
//        loadView()
//    }
//    
//    private func loadView() {
//        let imgView = makeImgView()
//        imgView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 30)
//        addSubview(imgView)
//        
//        let label1 = makeLabel1()
//        label1.frame = CGRect(x: 0, y: 50, width: bounds.width, height: 20)
//        addSubview(label1)
//        
//        let label2 = makeLabel2()
//        label2.frame = CGRect(x: 0, y: 50, width: bounds.width, height: 20)
//        addSubview(label2)
//        
//        let label3 = makeLabel3()
//        label3.frame = CGRect(x: 0, y: 50, width: bounds.width, height: 20)
//        addSubview(label3)
//        
//        let button = makeButton()
//        button.frame = CGRect(x: 0, y: 50, width: bounds.width, height: 20)
//        addSubview(button)
//        
//    }
//    
//    public func makeImgView() -> UIImageView {
//        let imgview = UIImageView()
//        imgview.backgroundColor = .purple
//        return imgview
//    }
//    
//    public func makeLabel1() -> UILabel {
//        let label = UILabel()
//        label.text = "커스텀1"
//        label.textAlignment = .center
//        return label
//    }
//    public func makeLabel2() -> UILabel {
//        let label = UILabel()
//        label.text = "커스텀2"
//        label.textAlignment = .center
//        return label
//    }
//    public func makeLabel3() -> UILabel {
//        let label = UILabel()
//        label.text = "커스텀3"
//        label.textAlignment = .center
//        return label
//    }
//    
//    public func makeButton() -> UIButton {
//        let button = UIButton()
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.setTitle("예약완료", for: .normal)
//        //        button.textAlignment = .center
//        //        button.backgroundColor = .soptYellow300
//        //        button.makeCornerRadius(ratio: 5)
//        //        button.titleLabel?.font = .soptBody3
//        return button
//    }
//}
