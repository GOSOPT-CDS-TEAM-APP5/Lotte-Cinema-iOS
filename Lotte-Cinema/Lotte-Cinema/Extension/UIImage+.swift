import UIKit
extension UIImage {
    
    static var photo_1: UIImage { UIImage(named: "AppIcon")! }
    static var logophoto: UIImage { UIImage(named: "logo_photo") ?? UIImage() }
    static var photo_2: UIImage { UIImage(named: "car_banner")! }
    static var moviefeed3: UIImage { UIImage(named: "comeout_photo")! }
    static var moviefeed6: UIImage { UIImage(named: "crycry_poster")! }
    static var moviefeed1: UIImage { UIImage(named: "dream_team_photo")! }
    static var moviechart2: UIImage { UIImage(named: "fastx_poster")! }
    static var specialBox1: UIImage { UIImage(named: "first_box")! }
    static var moviechart1: UIImage { UIImage(named: "guardians_of_the_galaxy_poster")! }
    static var eventPhoto2: UIImage { UIImage(named: "happy_package")! }
    static var eventPhoto1: UIImage { UIImage(named: "happy_photo")! }
    static var photo_11: UIImage { UIImage(named: "ic_chevron_right")! }
    static var icon_close: UIImage { UIImage(named: "ic_close")! }
    static var icon_event: UIImage { UIImage(named: "ic_event")! }
    static var icon_heart_2_filled: UIImage { UIImage(named: "ic_heart_2_filled")! }
    static var icon_heart_2_unfilled: UIImage { UIImage(named: "ic_heart_2_unfilled")! }
    static var icon_heart_3: UIImage { UIImage(named: "ic_heart_3")! }
    static var icon_shake_phone: UIImage { UIImage(named: "ic_shake_phone")! }
    static var icon_shake_ticket: UIImage { UIImage(named: "ic_shake_ticket")! }
    static var icon_share: UIImage { UIImage(named: "ic_share")! }
    static var icon_star: UIImage { UIImage(named: "ic_star")! }
    static var icon_menu: UIImage { UIImage(named: "icon_menu")! }
    static var icon_mypage: UIImage { UIImage(named: "icon_mypage")! }
    static var icon_popcorn: UIImage { UIImage(named: "icon_popcorn")! }
    static var icon_ticket: UIImage { UIImage(named: "icon_ticket")! }
    static var iconEmpty: UIImage { UIImage(named: "ic_empty")!}
    static var moviechart_4: UIImage { UIImage(named: "im_moon_banner")! }
    static var moviefeed4: UIImage { UIImage(named: "im_moon_poster")! }
    static var eventPhoto4: UIImage { UIImage(named: "lotte_cinema_club")! }
    static var moviefeed2: UIImage { UIImage(named: "mario_photo")! }
    static var headerPoster: UIImage { UIImage(named: "photo2")! }
    static var eventPhoto5: UIImage { UIImage(named: "plus_coupon")! }
    static var specialBox2: UIImage { UIImage(named: "second_box")! }
    static var special1: UIImage { UIImage(named: "small_company1")! }
    static var special2: UIImage { UIImage(named: "small_company2")! }
    static var special3: UIImage { UIImage(named: "small_company3")! }
    static var special4: UIImage { UIImage(named: "small_company4")! }
    static var special5: UIImage { UIImage(named: "small_company5")! }
    static var special6: UIImage { UIImage(named: "small_company6")! }
    static var special7: UIImage { UIImage(named: "small_company7")! }
    static var special8: UIImage { UIImage(named: "small_company8")! }
    static var moviechart3: UIImage { UIImage(named: "streamer_poster")! }
    static var moviefeed5: UIImage { UIImage(named: "streamer_small_poster")! }
    static var eventPhoto3: UIImage { UIImage(named: "super_mario")! }
    static var img1: UIImage { UIImage(named: "Img1")! }
    static var img2: UIImage { UIImage(named: "Img2")! }
    static var img3: UIImage { UIImage(named: "Img3")! }
    static var img4: UIImage { UIImage(named: "Img4")! }
    static var longImg: UIImage { UIImage(named: "longImg")! }
    //moviewchart3, moviechart_4, moviefeed6
    
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
}
