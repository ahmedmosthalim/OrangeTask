//
//  Date.swift
//
//  Created by Ahmed Mostafa
//

import Foundation

extension Date {
    @available(iOS 13.0, *)
    func toTimeAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }

    func nextHour() -> Date {
        var components = NSCalendar.current.dateComponents([.minute], from: self)
        let minute = components.minute ?? 0
        components.minute = 60 - minute
        return Calendar.current.date(byAdding: components, to: self) ?? Date()
    }

    func toString() -> String {
        return String(describing: self)
    }

    func isBeforeNow() -> Bool {
        return Date() < self
    }

    func isAfterNow() -> Bool {
        return Date() > self
    }
}

extension Date {
    func arabicTimeToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ar")
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }

    func englishTimeToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }

    func apiTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }

    func arabicDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ar")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }

    func englishDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }

    func apiDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }

    var dateToString: String? {
        return Language.isRTL() ? arabicDateToString() : englishDateToString()
    }

    func timeToString() -> String {
        return Language.isRTL() ? arabicTimeToString() : englishTimeToString()
    }
}
