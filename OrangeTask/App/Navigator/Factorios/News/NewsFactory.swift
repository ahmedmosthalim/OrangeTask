//
//  NewsFactory.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 07/12/2023.
//

import Foundation

class NewsFactory : MainNavigator {
    
    static func goToNewsList() -> NewsListVC {
        let vc = NewsListVC.create()
        let vm = NewsListViewModel(navigator: NewsNavigator(vc))
        vc.viewModel = vm
        return vc
    }
    
    static func goToNewsDetails(model:Article) -> NewsDetailsVC{
        let vc = NewsDetailsVC.create(model:model)
        let vm = NewsDetailsViewModel(navigator: NewsNavigator(vc))
        vc.viewModel = vm
        return vc
    }
}
