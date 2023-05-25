import Foundation

// MARK: - Djdjdj
struct TheaterListDataModel: Codable {
    let code: Int
    let message: String
    let data: [TheaterListData]
}

// MARK: - Datum
struct TheaterListData: Codable {
    let theaterID: Int
    let theaterName: String

    enum CodingKeys: String, CodingKey {
        case theaterID = "theaterId"
        case theaterName
    }
}
