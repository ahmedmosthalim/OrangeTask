//
//  NewsListVC.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 06/12/2023.
//

import UIKit

class NewsListVC: BaseVC {

    // MARK: - IBOutlets -
    @IBOutlet weak var searchTf: AppTextField!
    @IBOutlet weak var newsTableView: TableViewContentSized!

    // MARK: - Properties -
    private let refreshControl = UIRefreshControl()
    var viewModel: NewsListViewModel?
    // MARK: - Creation -
    static func create() -> NewsListVC {
        let vc = AppStoryboards.main.instantiate(NewsListVC.self)
        return vc
    }
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialDesign()
        viewModel?.viewDidLoad()
    }
    // MARK: - Design Methods -
    private func configureInitialDesign() {
        configureTableView()
        searchTf.delegate = self
    }
    private func configureTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(cellType: NewsListCell.self)
        viewModel?.newsData
            .compactMap({$0})
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.newsTableView.reloadData()
            }
            .store(in: &viewModel!.subscription)
    }
    // MARK: - IBActions -
    @IBAction func languageButtonPressed(_ sender: Any) {
        showAlertBeforeChangeLanguage()
    }
    // MARK: - Logic -
    
    private func showAlertBeforeChangeLanguage(){
        let alert = UIAlertController(title: "Change The Language".localized, message: "Would you like to use Arabic as your primary language?".localized, preferredStyle: .alert)
        let changeAction = UIAlertAction(title: "Change".localized, style: .destructive) { [weak self] _ in
            guard let self else {return}
            self.changeLanguage()
        }
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .default)
        alert.addAction(changeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    private func changeLanguage(){
        Language.currentLanguage() != Language.Languages.en ? Language.setAppLanguage(lang: Language.Languages.en) : Language.setAppLanguage(lang: Language.Languages.ar)
        restartHome()
    }
    
}

// MARK: - UITextFieldDelegate -

extension NewsListVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchAction(_:)), object: nil)
        perform(#selector(searchAction), with: nil, afterDelay: 0.5)
    }

    @objc func searchAction(_ textField: UITextField) {
        showIndicator()
        if let text = searchTf.text , !text.isEmpty {
            viewModel?.updateSearchText(text: text)
        }else {
            viewModel?.updateSearchText(text: "Orange")
        }
    }
}


extension NewsListVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemCounts ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsListCell.self, for: indexPath)
        cell.configureCell(model: viewModel?.getCurrentItem(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectDirection(viewModel?.getCurrentItem(index: indexPath.row))
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func restartHome() {
        let vc = NewsFactory.goToNewsList()
        let nav = BaseNav(rootViewController: vc)
        AppHelper.changeWindowRoot(vc: nav)
    }
}
