//
//  Print.swift
//
//  Created by Ahmed Mostafa
//

import Foundation

public func print(_ object: Any...) {
    #if DEBUG
    Swift.print(object)
    #endif
}
public func print(_ object: Any) {
    #if DEBUG
    Swift.print(object)
    #endif
}
