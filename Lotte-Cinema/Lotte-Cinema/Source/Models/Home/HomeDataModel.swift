import Foundation
import UIKit

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


//MARK: dummy
struct EventDataModel {
    let titleLabel1: String
    let titleLabel2: String
    let imageView: UIImage
}



let eventData: [EventDataModel] = [.init(titleLabel1: "해피 듬뿍 패키지",
                                         titleLabel2: "23.5.4~23.5.31",
                                         imageView: UIImage.eventPhoto2),
                                   .init(titleLabel1: "<슈퍼 마리오 브라더스>버튼\n뱃지 콤보 런칭",
                                         titleLabel2: "23.4.27~23.6.21",
                                         imageView: UIImage.eventPhoto3),
                                   .init(titleLabel1: "롯시클럽 Join us!",
                                         titleLabel2: "23.1.3~23.6.30",
                                         imageView: UIImage.eventPhoto4),
                                   .init(titleLabel1: "롯시클럽 추가혜택 쿠폰증정",
                                         titleLabel2: "23.1.3~23.7.31",
                                         imageView: UIImage.eventPhoto5)]

struct HsahtagDataModel {
    let HashtagTitle1: String
    let HashtagTitle2: String
    let HashtagImg: UIImage
}

let hashtagData: [HsahtagDataModel] = [.init(HashtagTitle1: "문재인입니다",
                                             HashtagTitle2: "5월 10일 대개봉",
                                             HashtagImg: UIImage.moviefeed4),
                                       .init(HashtagTitle1: "스트리머",
                                             HashtagTitle2: "5월 10일 대개봉",
                                             HashtagImg: UIImage.moviefeed5),
                                       .init(HashtagTitle1: "울지마 엄마",
                                             HashtagTitle2: "5월 17일 대개봉",
                                             HashtagImg: UIImage.moviefeed6)]
