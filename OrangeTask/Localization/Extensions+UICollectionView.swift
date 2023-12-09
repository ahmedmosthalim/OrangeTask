//
//  Extensions+UICollectionView.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

extension UICollectionViewFlowLayout {
    
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return Language.isRTL() ? true : false
    }
    
}
