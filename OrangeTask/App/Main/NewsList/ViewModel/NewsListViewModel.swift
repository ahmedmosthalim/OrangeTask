//
//  NewsListViewModel.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 06/12/2023.
//

import Foundation
import Combine



class NewsListViewModel : BaseViewModel {
    
    // MARK: - Properties -

    var subscription = Set<AnyCancellable>()
    var newsData = CurrentValueSubject<[Article]?, Never>([])
    var searchText: String?

    
    private var navigator: any NewsNavigatorProtocol

    init(navigator: any NewsNavigatorProtocol) {
        self.navigator = navigator
    }
    var itemCounts: Int? {
        return newsData.value?.count
    }
    func getCurrentItem(index: Int) -> Article? {
        return newsData.value?[index]
    }
    func viewDidLoad() {
        showIndicator()
        getNews(search: searchText ?? "Orange")
    }
    
    func updateSearchText(text: String) {
        searchText = text
        resetData()
    }
    func selectDirection(_ model: Article?) {
        guard let model else {return}
        goToNewsDetails(model: model)
    }
    func resetData() {
        showIndicator()
        newsData.value?.removeAll()
        getNews(search: searchText ?? "Orange")
    }
}

// MARK: - Networking -
extension NewsListViewModel {
    private func getNews(search: String) {
        showIndicator()
        NewsListRouter.everything(search: search).send { [weak self] (response: NewsModel) in
            guard let self = self else { return }
            hideIndicator()
            self.newsData.send(response.articles)
        }
    }
}
// MARK: - Routes -
extension NewsListViewModel {
    private func goToNewsDetails(model:Article) {
        if model.title ==  "[Removed]" {
            self.showErrorAlert(error: "The post is no longer exists".localized)
        }else {
            navigator.navigateTo(destination: .newsDetails(model: model))
        }
    }
}
