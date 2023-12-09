//
//  NewsListRouter.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 06/12/2023.
//

import Foundation
import Alamofire


enum NewsListRouter {
    case everything(search:String)
    case topHeadlines(search:String)
}


extension NewsListRouter: APIRouter {
    
    var method : HTTPMethod {
        switch self {
        case .everything , .topHeadlines :
            return .get
        }
    }
    var path: ServerPath {
        switch self {
        case .everything :
            return NewsListServerPath.everything
        case .topHeadlines :
            return NewsListServerPath.topHeadlines
        }
    }
    var parameters: APIParameters? {
        switch self {
        case let .everything(search):
            return [
                NewsListParameterKeys.apiKey.rawValue : "669c064547fe47e2aae967f3cb9e4218",
                NewsListParameterKeys.q.rawValue : search,
                NewsListParameterKeys.sortBy.rawValue : "publishedAt"
            ]
        case let  .topHeadlines(search):
            return [
                NewsListParameterKeys.apiKey.rawValue : "669c064547fe47e2aae967f3cb9e4218",
                NewsListParameterKeys.q.rawValue : search,
                NewsListParameterKeys.sortBy.rawValue : "publishedAt"
            ]
        }
    }
}
