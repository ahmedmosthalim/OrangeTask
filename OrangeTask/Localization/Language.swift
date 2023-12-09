//
//  Language.swift
//
//  Created by Ahmed Mostafa

import UIKit

struct Language {
    enum Languages {
        static let en = "en"
        static let ar = "ar"
    }

    static func currentLanguage() -> String {
        let languages = UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray
        let firstLanguage = languages.firstObject as! String
        return firstLanguage
    }

    static func apiLanguage() -> String {
        if currentLanguage().contains(Languages.ar) {
            return Languages.ar
        } else {
            return Languages.en
        }
    }

    static func isRTL() -> Bool {
        return currentLanguage().contains(Languages.ar) ? true : false
    }

    static func setAppLanguage(lang: String) {
        UserDefaults.standard.set([lang, currentLanguage()], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        handleViewDirection()
    }

    static func handleViewDirection() {
        UIPageControl.appearance().semanticContentAttribute = isRTL() ? .forceRightToLeft : .forceLeftToRight
        UIStackView.appearance().semanticContentAttribute = isRTL() ? .forceRightToLeft : .forceLeftToRight
        UISwitch.appearance().semanticContentAttribute = isRTL() ? .forceRightToLeft : .forceLeftToRight
        UIView.appearance().semanticContentAttribute = isRTL() ? .forceRightToLeft : .forceLeftToRight
        UICollectionView.appearance().semanticContentAttribute = isRTL() ? .forceRightToLeft : .forceLeftToRight
        UICollectionViewCell.appearance().semanticContentAttribute = isRTL() ? .forceRightToLeft : .forceLeftToRight
        UITextField.appearance().textAlignment = isRTL() ? .right : .left
        UITextView.appearance().textAlignment = isRTL() ? .right : .left
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    var payLocalized: String {
        return NSLocalizedString(self, tableName: "PayLocalizable", bundle: Bundle.main, value: "", comment: "")
    }

    var validationLocalized: String {
        return NSLocalizedString(self, tableName: "ValidationLocalized", bundle: Bundle.main, value: "", comment: "")
    }

    var helperLocalizable: String {
        return NSLocalizedString(self, tableName: "HelperLocalizable", bundle: Bundle.main, value: "", comment: "")
    }

    var coreLocalizable: String {
        return NSLocalizedString(self, tableName: "CoreLocalizable", bundle: Bundle.main, value: "", comment: "")
    }
}
