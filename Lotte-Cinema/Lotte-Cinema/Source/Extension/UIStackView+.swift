import UIKit

extension UIStackView {
    
    func addArangeSubViews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
    
}
