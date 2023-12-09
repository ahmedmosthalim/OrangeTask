//
//  Constant.swift
//
//  Created by Ahmed Mostafa
//

import Foundation

// MARK: - Request Enums -

enum Server: String {
    case baseURL = "https://newsapi.org/v2/"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case lang
    case macAddress = "mac_address"
}

enum ContentType: String {
    case json = "application/json"
    case deviceType = "ios"
    case tokenBearer = "Bearer "
}

// MARK: - Response Enums -

enum APIServerResponseKey: String, Codable {
    case success, fail
//    case unauthenticated = "Unauthenticated"
}

// MARK: - Errors -

enum APIErrors: String {
    case connectionError
    case canNotDecodeData
}
