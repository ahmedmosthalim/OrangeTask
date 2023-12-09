//
//  Optional.swift
//
//  Created by Ahmed Mostafa
//

import Foundation

extension Optional where Wrapped == Bool {
    mutating func toggleOptional() -> Bool {
        guard let value = self else {
            return true
        }
        return !value
    }
}
