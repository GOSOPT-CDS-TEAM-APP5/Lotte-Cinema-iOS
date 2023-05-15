import UIKit
import SnapKit
import Then

class CinemaInfoView: UIStackView {
    private var topStackViewImages: [UIImage] = [ImageLiterals.icChalotte, ImageLiterals.icSplex, ImageLiterals.icSuperS, ImageLiterals.icSuper4d]
    private var bottomStackViewImages: [UIImage] = [ImageLiterals.icColourium, ImageLiterals.icCineComport, ImageLiterals.icCineFamily, ImageLiterals.icCineCouple]
    
    init() {
        super.init(frame: .zero)
        self.setViewConfig()
        self.setLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setViewConfig() {
        self.distribution = .fillProportionally
        self.axis = .vertical
        self.spacing = 4
    }
    
    private func setLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addArangeSubViews(topStackView, bottomStackView)
        topStackViewImages.forEach {
            let chipView = CinemaChipView(image: $0)
            chipView.translatesAutoresizingMaskIntoConstraints = false
            self.topStackView.addArangeSubViews(chipView)
        }
        
        bottomStackViewImages.forEach {
            let chipView = CinemaChipView(image: $0)
            chipView.translatesAutoresizingMaskIntoConstraints = false
            self.bottomStackView.addArangeSubViews(chipView)
        }
        
    }
    
    private let topStackView = UIStackView().then {
        $0.distribution = .fillEqually
        $0.spacing = 6
        $0.axis = .horizontal
    }
    private let bottomStackView = UIStackView().then {
        $0.distribution = .fillEqually
        $0.spacing = 6
        $0.axis = .horizontal
    }
    
    
}
