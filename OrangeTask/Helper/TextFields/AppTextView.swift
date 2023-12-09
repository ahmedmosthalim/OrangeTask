//
//  AppTextView.swift
//  Orange Task
//
//  Created by abdullah tarek on 31/10/2022.
//

import UIKit

class AppTextViewView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        confirmViewDesign()
    }

    private func confirmViewDesign() {
        layer.cornerRadius = 5
        clipsToBounds = true
        backgroundColor = AppColors.shared.whiteColor
        layer.borderWidth = 1
        layer.borderColor = AppColors.shared.borderColor.cgColor
    }
}

class AppTextView: UITextView {
    var didChangeText: ((String) -> Void)?
    var placeHolder: String? = "" {
        didSet {
            if text?.isEmpty == true {
                text = placeHolder
                textColor = Theme.colors.placeHolderColor
            } else {
                textColor = Theme.colors.mainDarkFontColor
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        delegate = self
        keyboardAppearance = .light
        tintColor = Theme.colors.mainColor
        textColor = Theme.colors.mainDarkFontColor
    }
}

extension AppTextView: UITextViewDelegate, UITextFieldDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Theme.colors.placeHolderColor {
            textView.text = nil
            textView.textColor = Theme.colors.mainDarkFontColor
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = Theme.colors.placeHolderColor
        }
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        if textView.textColor == Theme.colors.placeHolderColor {
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        didChangeText?(textView.text ?? "")
    }
}
