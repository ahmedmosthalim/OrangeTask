//
//  NewsModel.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 06/12/2023.
//

import Foundation



class NewsModel: Codable {
    
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    
    enum CodingKeys : String , CodingKey {
        case status
        case totalResults
        case articles
    }
}

// MARK: - Article
class Article: Codable {
    var source: SourceModel?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    
    enum CodingKeys : String , CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }

}

// MARK: - Source
class  SourceModel: Codable {
    var id: String?
    var name: String?
    
    enum CodingKeys : String , CodingKey {
        case id
        case name
    }
}
