//
//  Double.swift
//
//  Created by Ahmed Mostafa
//

import Foundation

extension Double {
    func toPrice() -> String {
        return String(format: "%.01f", self) + " "
    }
    func toKiloMeter() -> String {
        return String(format: "%.01f", self) + " "
    }
    func toString() -> String {
        return String(self)
    }
}


extension Int {
    // isEven: -- self % 2 == 0
    var isEven: Bool { self.isMultiple(of: 2) }
    
    func toString() -> String {
        return String(self)
    }
}

