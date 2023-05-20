import Foundation
import UIKit

struct ActorDataModel {
    let profileImages: UIImage
    let names: String
    let position: String
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
