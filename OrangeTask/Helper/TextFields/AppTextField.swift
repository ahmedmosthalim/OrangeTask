//
//  AppTextField.swift
//  Orange Task
//
//  Created by abdullah tarek on 31/10/2022.
//

import UIKit

class AppTextField: UITextField {
    override func awakeFromNib() {
//        borderStyle = .none
        contentVerticalAlignment = .center
        borderColor = AppColors.shared.borderColor
        borderWidth = 1
        cornerRadius = 4
        font = UIFont(name: FontFamilySize.regular.size, size: 14)
        attributedPlaceholder = NSAttributedString(
            string: placeholder != nil ? placeholder! : "",
            attributes: [
                NSAttributedString.Key.foregroundColor: AppColors.shared.placeHolderColor,
            ])
    }
}
