//
//  Blurview.swift
//
//
//  Created by Ahmed Fathy on 03/01/2023.
//

import UIKit

class BlurView : UIView {
    override  func awakeFromNib() {
        let blur = UIBlurEffect(style: .regular)
        let visual = UIVisualEffectView(effect: blur)
        visual.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(visual, at: 0)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: visual.leadingAnchor),
            trailingAnchor.constraint(equalTo: visual.trailingAnchor),
            topAnchor.constraint(equalTo: visual.topAnchor),
            bottomAnchor.constraint(equalTo: visual.bottomAnchor)
        ])
    }
}
