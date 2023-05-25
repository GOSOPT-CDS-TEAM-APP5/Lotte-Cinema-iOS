import Foundation
import UIKit

struct ActorDataModel {
    let profileImages: UIImage
    let names: String
    let position: String
}

struct TrailerDataModel {
    let image: UIImage
    let title: String
}

let actorData: [ActorDataModel] = [.init(profileImages: ImageLiterals.james_gunn,
                                         names: "제임스 건",
                                         position: "감독"),
                                   .init(profileImages: ImageLiterals.star_road,
                                         names: "크리스 프렛",
                                         position: ""),
                                   .init(profileImages: ImageLiterals.gamora,
                                         names: "조 샐다나",
                                         position: ""),
                                   .init(profileImages: ImageLiterals.drax,
                                         names: "데이브 바티스타",
                                         position: ""),
                                   .init(profileImages: ImageLiterals.nebula,
                                         names: "카렌 길런",
                                         position: ""),
                                   .init(profileImages: ImageLiterals.mantis,
                                         names: "폼 클레멘티\n에프",
                                         position: ""),
                                   .init(profileImages: ImageLiterals.groot,
                                         names: "빈 디젤",
                                         position: ""),
                                   .init(profileImages: ImageLiterals.rocket,
                                         names: "브래들리 쿠퍼",
                                         position: ""),
                                   .init(profileImages: ImageLiterals.adam_warlock,
                                         names: "윌 폴터",
                                         position: "")]

let trailerData: [TrailerDataModel] = [.init(image: ImageLiterals.imgTeaser1, title: "티저 예고편"),
                                       .init(image: ImageLiterals.imgTeaser2, title: "메인 예고편"),
                                       .init(image: ImageLiterals.imgTeaser3, title: "'돌아온 가디언즈' 30초 예고편"),
                                       .init(image: ImageLiterals.imgTeaser4, title: "Team '가디언즈'가 맞설 마지막 미션!"),
                                       .init(image: ImageLiterals.imgTeaser5, title: "전 세계 최초 개봉! 전 포맷 예매 오픈!")]

let posterData: [UIImage] = [ImageLiterals.gog_poster_still_cut,
                             ImageLiterals.still_cut1,
                             ImageLiterals.still_cut2,
                             ImageLiterals.still_cut3,
                             ImageLiterals.still_cut4,
                             ImageLiterals.still_cut5]
