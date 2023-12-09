//
//  SimpleTextView.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 09/12/2023.
//

import Foundation
import UIKit

class SimpleTextView : UITextView, UITextViewDelegate {
    override func awakeFromNib() {
        super.awakeFromNib()
        confirmViewDesign()
    }
    func confirmViewDesign(){
        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
        self.cornerRadius = 8
        self.borderWidth = 1
        self.textColor = .systemGray
        self.delegate = self
    }
    
    
}
