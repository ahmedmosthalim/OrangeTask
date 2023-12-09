//
//  NewsDetailsVC.swift
//  orangeInnovationEgypt
//
//  Created by Ahmed Mostafa on 07/12/2023.
//

import UIKit

class NewsDetailsVC: BaseVC {
    
    // MARK: - IBOutlets -
    @IBOutlet private weak var articleAuthorLabel       : UILabel!
    @IBOutlet private weak var articleImageView         : UIImageView!
    @IBOutlet private weak var articleTitleLabel        : UILabel!
    @IBOutlet private weak var articleSourceLabel       : UILabel!
    @IBOutlet private weak var articleDescTextView      : UITextView!
    @IBOutlet private weak var articleContentTextView   : UITextView!
    // MARK: - Properties -
    var viewModel: NewsDetailsViewModel?
    private var model : Article?
    // MARK: - Creation -
    static func create(model:Article) -> NewsDetailsVC {
        let vc = AppStoryboards.main.instantiate(NewsDetailsVC.self)
        vc.model = model
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
        setupView(model:model)
        articleDescTextView.translatesAutoresizingMaskIntoConstraints = true
        articleContentTextView.translatesAutoresizingMaskIntoConstraints = true
        articleDescTextView.sizeToFit()
        articleContentTextView.sizeToFit()
    }
    private func setupView(model:Article?){
        guard let model else {return}
        articleAuthorLabel      .text = model.author
        articleTitleLabel       .text = model.title
        articleSourceLabel      .text = model.source?.name
        articleDescTextView     .text = model.description
        articleContentTextView  .text = model.content
        articleImageView.setWith(url: model.urlToImage)
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.pop()
    }
    
    @IBAction func safariButtonPressed(_ sender: Any) {
        guard let url = model?.url else {return}
        if let url = URL(string: url    ) {
            UIApplication.shared.open(url)
        }
    }
}
