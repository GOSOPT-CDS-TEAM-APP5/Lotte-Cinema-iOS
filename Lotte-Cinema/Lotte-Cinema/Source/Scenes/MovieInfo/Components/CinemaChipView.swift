import UIKit
import Then
import SnapKit

class CinemaChipView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.bindImage(image: image)
        self.setLayout()
    }
    
    private func bindImage(image: UIImage) {
        self.imageView.image = image
    }
    
    private func setLayout() {
        self.addSubview(imageView)
        self.layer.borderColor = UIColor.g_200.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 13
        self.backgroundColor = .g_50
        
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
}
