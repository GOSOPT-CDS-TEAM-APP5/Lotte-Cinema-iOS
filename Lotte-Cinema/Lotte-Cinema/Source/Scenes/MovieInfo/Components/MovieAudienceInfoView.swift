import UIKit
import Then
import SnapKit

class MovieAudienceInfoView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    internal func bindTextData(audienceRating: Double,
                               reservationRating: Double,
                               cumulativeNumber: Int) {
        setAudienceRatingLabelConfig(audienceRating)
        setReservationRatingLabelConfig(reservationRating)
        setCumlativeLabelConfig(cumulativeNumber)
        
    }
    
    private func setCumlativeLabelConfig(_ cumulativeNumber: Int) {
        //누적 관객수 라벨
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        if let formattedString = numberFormatter.string(from: NSNumber(value: cumulativeNumber)) {
            let cumulativeAttributedTitleString = "누적 관객수\n".setAttributeString(range: .init(location: 0, length: "누적 관객수".count),
                                                                                font: .NotoSansMedium(ofSize: 10),
                                                                                textColor: .white)
            let cumulativeAttributedValueString = "\(formattedString)".setAttributeString(range: .init(location: 0, length: "\(formattedString)".count),
                                                                                font: .RobotoMedium(ofSize: 18),
                                                                                textColor: .white)
            let cumlativeAttributedNumberString = " 명\n".setAttributeString(range: .init(location: 0, length: 2),
                                                                           font: .NotoSansRegular(ofSize: 12),
                                                                           textColor: .white)
            
            let cumlativeAttributedDateString = "\(Date().getTodayDateString("yyyy.MM.dd")) 기준".setAttributeString(range: .init(location: 0, length: "\(Date().getTodayDateString("yyyy.MM.dd")) 기준".count),
                                                                                                                   font: .RobotoMedium(ofSize: 8),
                                                                                                                   textColor: .g_200)
            let dateMutableAttributedString = NSMutableAttributedString(attributedString: cumlativeAttributedDateString)
            dateMutableAttributedString.addAttribute(.baselineOffset, value: -5, range: .init(location: 0, length: cumlativeAttributedDateString.string.count))
            
            var resultCumulativeAttributedString = NSMutableAttributedString(attributedString: cumulativeAttributedTitleString)
            resultCumulativeAttributedString.append(cumulativeAttributedValueString)
            resultCumulativeAttributedString.append(cumlativeAttributedNumberString)
            resultCumulativeAttributedString.append(dateMutableAttributedString)
            self.cumulativeAudienceLabel.attributedText = resultCumulativeAttributedString
            
        }
    }
    
    private func setReservationRatingLabelConfig(_ reservationRating: Double) {
        //예매율 라벨
        let reservationAttributedTitleString = "예매율 1위\n".setAttributeString(range: .init(location: 0, length: "예메율 1위".count),
                                                                                                      font: .NotoSansMedium(ofSize: 10),
                                                                                                      textColor: .white)
        let reservationAttributedValueString = "\(reservationRating)".setAttributeString(range: .init(location: 0, length: "\(reservationRating)".count),
                                                                                         font: .RobotoMedium(ofSize: 18),
                                                                                         textColor: .white)
        let reservationAttributedPercentString = " %".setAttributeString(range: .init(location: 0, length: 2),
                                                                        font: .NotoSansRegular(ofSize: 12),
                                                                        textColor: .white)
        var resultReservationAttributedString = NSMutableAttributedString(attributedString: reservationAttributedTitleString)
        resultReservationAttributedString.append(reservationAttributedValueString)
        resultReservationAttributedString.append(reservationAttributedPercentString)
        self.reservationRateLabel.attributedText = resultReservationAttributedString
    }
    
    private func setAudienceRatingLabelConfig(_ audienceRating: Double) {
        //관람객 평점
        audienceRatingAttachImg.do {
            $0.image = ImageLiterals.icStar
        }
        audienceRatingLabel.do{
            let firstString = "관람객 평점".setAttributeString(range: .init(location: 0, length: "관람객 평점".count),
                                                          font: .NotoSansMedium(ofSize: 10),
                                                          textColor: .white)
            
            let secondImg = NSAttributedString(attachment: audienceRatingAttachImg)
            var thirdString = "\(audienceRating)".setAttributeString(range: .init(location: 0, length: "\(audienceRating)".count),
                                                                                                font: .RobotoMedium(ofSize: 18),
                                                                                                textColor: .white)
            let thirdMutableAttributedString = NSMutableAttributedString(attributedString: thirdString)
            thirdMutableAttributedString.addAttribute(.baselineOffset, value: 5, range: .init(location: 0, length: thirdString.string.count))
            $0.labelWithImg(composition: firstString, secondImg, thirdMutableAttributedString,
                            spacing: 0)
            $0.numberOfLines = 2
        }
    }
    
    
    private func setLayout() {
        self.backgroundColor = .sub_1
        self.addSubviews(audienceRatingLabel, reservationRateLabel, cumulativeAudienceLabel)
        
        audienceRatingLabel.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.top.equalTo(self.reservationRateLabel)
            $0.trailing.equalTo(self.reservationRateLabel.snp.leading).inset(-69)
        }
        
        reservationRateLabel.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(18)
        }
        
        cumulativeAudienceLabel.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.top.equalTo(self.reservationRateLabel.snp.top)
            $0.leading.equalTo(reservationRateLabel.snp.trailing).inset(-37)
        }
    }
    
    private let audienceRatingAttachImg = NSTextAttachment()
    private let audienceRatingLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    private let reservationRateLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    private let cumulativeAudienceLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
}
