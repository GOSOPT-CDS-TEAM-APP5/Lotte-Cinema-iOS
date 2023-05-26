import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        addImageViews()
        setStyle()
    }
    
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(containerView.snp.width).multipliedBy(5)
            make.top.equalToSuperview().offset(20) // 수정사항 1: containerView의 상단에 20의 여백을 추가합니다.
            make.bottom.equalToSuperview().offset(-20) // 수정사항 2: containerView의 하단에 20의 여백을 추가합니다.
        }
    }
    
    func addImageViews() {
        let imageNames = ["Img1","Img2","Img3","Img4"]
        var previousImageView: UIImageView?
        
        for (index, imageName) in imageNames.enumerated() {
            let imageView = UIImageView().then {
                $0.image = UIImage(named: imageName)
                $0.contentMode = .scaleAspectFill
            }
            containerView.addSubview(imageView)
            
            imageView.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(0) // 수정사항 3: 이미지 뷰의 leading에 20의 여백을 추가합니다.
                make.right.equalToSuperview().offset(0) // 수정사항 4: 이미지 뷰의 trailing에 20의 여백을 추가합니다.
                make.height.equalTo(600)
                
                
                if let previousImageView = previousImageView {
                    make.top.equalTo(previousImageView.snp.bottom).offset(20)
                } else {
                    make.top.equalToSuperview().offset(20)
                }
                
                if index == imageNames.count - 1 {
                    make.bottom.equalToSuperview().offset(-20)
                }
            }
            
            previousImageView = imageView
        }
    }
}

extension UIView {
    func previousSibling() -> UIView? {
        guard let superview = superview else { return nil }
        
        for index in 1..<superview.subviews.count {
            if superview.subviews[index] == self {
                return superview.subviews[index-1]
            }
        }
        
        return nil
    }
}
