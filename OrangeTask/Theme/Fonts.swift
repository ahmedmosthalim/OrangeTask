//
//  Fonts.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

/*
 This also to change font for all the app font but at some cases font not change (ex:- UIAlertController action fonts) so we use the above extension too
 */

let fontFamilyName = "URWDINArabic"

public func printAppFont() {
    UIFont.familyNames.forEach({ familyName in
        let fontNames = UIFont.fontNames(forFamilyName: familyName)
        print(familyName, fontNames)
    })
}

//["URWDINArabic-Regular", "URWDINArabic-Light", "URWDINArabic-Medium", "URWDINArabic-Demi", "URWDINArabic-Bold", "URWDINArabic-Black"]


enum FontFamilySize: String {
    case black
    case bold
    case semibold
    case medium
    case regular
    
    var size : String {
        switch self {
        case .black:
            return fontFamilyName + "-Black"
        case .bold:
            return fontFamilyName + "-Bold"
        case .semibold:
            return fontFamilyName + "-Demi"
        case .medium:
            return fontFamilyName + "-Medium"
        case .regular:
            return fontFamilyName + "-Regular"
        }
    }
}

extension UILabel {
    @objc var substituteFontName: String {
        get {
            return font.fontName
        }
        set {
            let fontNameToTest = font.fontName.lowercased()
            var fontName = newValue

            if fontNameToTest.range(of: "black") != nil {
                fontName += "-Black"
            } else if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold"
            } else if fontNameToTest.range(of: "semibold") != nil {
                fontName += "-Demi"
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium"
            } else if fontNameToTest.range(of: "regular") != nil {
                fontName += "-Regular"
            } else {
                fontName += "-SemiBold"
            }

            font = UIFont(name: fontName, size: font.pointSize)
        }
    }
}

extension UITextView {
    @objc var substituteFontName: String {
        get {
            return font?.fontName ?? ""
        }
        set {
            let fontNameToTest = font?.fontName.lowercased() ?? ""
            var fontName = newValue

            if fontNameToTest.range(of: "black") != nil {
                fontName += "-Black"
            } else if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold"
            } else if fontNameToTest.range(of: "semibold") != nil {
                fontName += "-Demi"
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium"
            } else if fontNameToTest.range(of: "regular") != nil {
                fontName += "-Regular"
            } else {
                fontName += "-SemiBold"
            }

            font = UIFont(name: fontName, size: font?.pointSize ?? 17)
        }
    }
}

extension UITextField {
    @objc var substituteFontName: String {
        get {
            return font?.fontName ?? ""
        }
        set {
            let fontNameToTest = font?.fontName.lowercased() ?? ""
            var fontName = newValue

            if fontNameToTest.range(of: "black") != nil {
                fontName += "-Black"
            } else if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold"
            } else if fontNameToTest.range(of: "semibold") != nil {
                fontName += "-Demi"
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium"
            } else if fontNameToTest.range(of: "regular") != nil {
                fontName += "-Regular"
            } else {
                fontName += "-SemiBold"
            }

            font = UIFont(name: fontName, size: font?.pointSize ?? 17)
        }
    }
}
