//
//  NewsNavigator.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 07/12/2023.
//

import Foundation

protocol NewsNavigatorProtocol {
    func navigateTo(destination: NewsDestination)
}

enum NewsDestination {
    case newsDetails(model:Article)
    case newsDetailsWithSafari(url:String)
    case pop
}


class NewsNavigator : MainNavigator , NewsNavigatorProtocol {
    
    func navigateTo(destination:NewsDestination){
        
        switch destination {
            
        case let .newsDetails(model):
            controller.push(NewsFactory.goToNewsDetails(model: model))
            
        case let .newsDetailsWithSafari(url) :
            print("newsDetailsWithSafari")
            
        case .pop :
            controller.pop()
            
        }
    }
}
