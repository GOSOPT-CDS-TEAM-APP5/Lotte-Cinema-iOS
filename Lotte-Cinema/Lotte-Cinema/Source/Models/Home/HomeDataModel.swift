import Foundation

struct HomeDataModel: Codable {
    let movieID: Int
    let movieName: String
    let reservationRatio, scoreOfStar: Double
    let age, releaseDate: Int
    let genre: String
    let playFullTime: Int
    let synopsis: String
    let release, artte: Bool

    enum CodingKeys: String, CodingKey {
        case movieID = "movieId"
        case movieName, reservationRatio, scoreOfStar, age, releaseDate, genre, playFullTime, synopsis, release, artte
    }
}
