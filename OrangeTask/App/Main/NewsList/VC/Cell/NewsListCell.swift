//
//  NewsListCell.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 08/12/2023.
//

import UIKit

class NewsListCell: UITableViewCell {

    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(model:Article?){
        newsSourceLabel.text = model?.source?.name
        newsTitleLabel.text = model?.title
        newsImageView.setWith(url: model?.urlToImage)
    }
    
}
