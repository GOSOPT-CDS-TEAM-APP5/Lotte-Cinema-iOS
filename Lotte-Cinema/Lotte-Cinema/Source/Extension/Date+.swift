import UIKit
import Foundation

extension Date {
    func getTodayDateString(_ format: String) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let today = dateFormatter.string(from: Date())
        return today
    }
}
