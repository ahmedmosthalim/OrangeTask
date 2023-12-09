//
//  NewsDetailsViewModel.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 07/12/2023.
//

import Foundation
import Combine

class NewsDetailsViewModel : BaseViewModel {
    
    // MARK: - Properties -

    var subscription = Set<AnyCancellable>()
    var newsData = CurrentValueSubject<[Article]?, Never>([])
    var searchText: String?

    
    private var navigator: any NewsNavigatorProtocol

    init(navigator: any NewsNavigatorProtocol) {
        self.navigator = navigator
    }

    func viewDidLoad() {
    }
    
    func resetData() {
    }

}
