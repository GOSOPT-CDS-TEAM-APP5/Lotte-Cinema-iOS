import Foundation
import UIKit

extension String {
    func setAttributeString(range: NSRange, font: UIFont, textColor: UIColor) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(.foregroundColor, value: textColor, range: range)
        attributeString.addAttribute(.font, value: font, range: range)
        return attributeString
    }
}
