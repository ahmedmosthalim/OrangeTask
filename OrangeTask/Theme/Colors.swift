//
//  Colors.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

final class AppColors {
    static let shared: AppColors = AppColors()

    private init() {}

    private func createColor(named: ColorNames) -> UIColor {
        guard let color = UIColor(named: named.rawValue) else {
            fatalError("No color found in assetes with the name \(named.rawValue) please add the color with this name to it")
        }
        return color
    }

    // MARK: - Names -

    private enum ColorNames: String {
        case mainDarkFontColor
        case secondaryDarkFontColor
        case mainLightFontColor
        case secondaryLightFontColor
        case waytatFontColor

        case myMessageChatColor
        case otherMessageChatColor

        case darkRed
        case orange
        case blue
        case yellow
        case green

        case errorColor
        case successColor
        case warningColor

        case mainColor
        case mainWithAlph
        case secondaryColor
        case secondaryColorWithAlph

        case mainBackgroundColor
        case secondaryBackgroundColor

        case whiteColor
        case blackColor

        case shadowColor
        case borderColor

        case textFielBgColor
        case placeHolderColor

        case grayButton

        case activeState
        case inactiveState
    }

    // MARK: - Font -

    var mainDarkFontColor: UIColor {
        return createColor(named: .mainDarkFontColor)
    }

    var myMessageChatColor: UIColor {
        return createColor(named: .myMessageChatColor)
    }

    var otherMessageChatColor: UIColor {
        return createColor(named: .otherMessageChatColor)
    }

    var secondryDarkFontColor: UIColor {
        return createColor(named: .secondaryDarkFontColor)
    }

    var mainLightFontColor: UIColor {
        return createColor(named: .mainLightFontColor)
    }

    var secondryLightFontColor: UIColor {
        return createColor(named: .secondaryLightFontColor)
    }

    var waytatFontColor: UIColor {
        return createColor(named: .waytatFontColor)
    }

    var activeState: UIColor {
        return createColor(named: .activeState)
    }

    var inactiveState: UIColor {
        return createColor(named: .inactiveState)
    }

    // MARK: - Order state color -

    /*
     dark red -> #D80000
     orange -> #F38B02
     yellow -> #FFBC00
     green -> #73AF00
     blue -> #03A5B0
     */

    var darkRed: UIColor {
        return createColor(named: .darkRed)
    }

    var orange: UIColor {
        return createColor(named: .orange)
    }

    var blue: UIColor {
        return createColor(named: .blue)
    }

    var yellow: UIColor {
        return createColor(named: .yellow)
    }

    var green: UIColor {
        return createColor(named: .green)
    }

    // MARK: - Alerts -

    var errorColor: UIColor {
        return createColor(named: .errorColor)
    }

    var successColor: UIColor {
        return createColor(named: .successColor)
    }

    var warningColor: UIColor {
        return createColor(named: .warningColor)
    }

    // MARK: - Views -

    var whiteColor: UIColor {
        return createColor(named: .whiteColor)
    }

    var blackColor: UIColor {
        return createColor(named: .blackColor)
    }

    var mainColor: UIColor {
        return createColor(named: .mainColor)
    }

    var mainWithAlph: UIColor {
        return createColor(named: .mainWithAlph)
    }

    var secondaryColor: UIColor {
        return createColor(named: .secondaryColor)
    }

    var secondaryColorWithAlph: UIColor {
        return createColor(named: .secondaryColorWithAlph)
    }

    var mainBackgroundColor: UIColor {
        return createColor(named: .mainBackgroundColor)
    }

    var secondaryBackgroundColor: UIColor {
        return createColor(named: .secondaryBackgroundColor)
    }

    var textFielBgColor: UIColor {
        return createColor(named: .textFielBgColor)
    }

    var borderColor: UIColor {
        return createColor(named: .borderColor)
    }

    var placeHolderColor: UIColor {
        return createColor(named: .placeHolderColor)
    }

    var grayButton: UIColor {
        return createColor(named: .grayButton)
    }

    // MARK: - Layers -

    var shadowColor: CGColor {
        return createColor(named: .shadowColor).cgColor
    }
}
