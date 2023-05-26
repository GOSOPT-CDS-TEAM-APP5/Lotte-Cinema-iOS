import Foundation

struct RegionDataModel: Codable {
    let code: Int
    let message: String
    let data: [RegionData]
}

// MARK: - Datum
struct RegionData: Codable {
    let regionID: Int
    let regionName: String
    let theaterCount: Int

    enum CodingKeys: String, CodingKey {
        case regionID = "regionId"
        case regionName, theaterCount
    }
}
