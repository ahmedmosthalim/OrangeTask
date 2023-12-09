//
//  NewsListServerPath.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 06/12/2023.
//

import Foundation

enum NewsListServerPath {
    case everything
    case topHeadlines
}

extension NewsListServerPath: ServerPath {
    var value: String {
        switch self {
        case .everything:
            return "everything"
        case .topHeadlines:
            return "topHeadlines"
        }
    }
}
