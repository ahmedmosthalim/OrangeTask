//
//  APIGloabelResponse.swift
//
//  Created by Ahmed Mostafa
//

import Foundation


class APIGlobalResponse: Codable {
    var key: APIServerResponseKey
    var message: String
    var userStatus: String?
    var paginate: Paginate?
    
    enum CodingKeys: String, CodingKey {
        case key
        case message = "msg"
        case paginate
        case userStatus = "user_status"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decode(APIServerResponseKey.self, forKey: .key)
        message = try values.decode(String.self, forKey: .message)
        message = try values.decode(String.self, forKey: .message)
        userStatus = try values.decode(String.self, forKey: .userStatus)
        paginate = try values.decodeIfPresent(Paginate.self, forKey: .paginate)
    }
    
}

class APIGenericResponse<T: Codable>: APIGlobalResponse {
    
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case data
        case key
        case message = "msg"
        case paginate
        case userStatus = "user_status"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decode(APIServerResponseKey.self, forKey: .key)
        message = try values.decode(String.self, forKey: .message)
        userStatus = try values.decode(String.self, forKey: .userStatus)
        paginate = try values.decodeIfPresent(Paginate.self, forKey: .paginate)
        data = try values.decodeIfPresent(T.self, forKey: .data)
    }
    
}

struct Paginate: Codable {
    let currentPage: Int
    let lastPage: Int
    let perPage: Int
    let total: Int
}


// MARK: - Pagination
struct Pagination: Codable {
    var total, count, perPage: Int?
    var nextPageURL, pervPageURL: String?
    var currentPage, totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case total, count
        case perPage = "per_page"
        case nextPageURL = "next_page_url"
        case pervPageURL = "perv_page_url"
        case currentPage = "current_page"
        case totalPages = "total_pages"
    }
}
