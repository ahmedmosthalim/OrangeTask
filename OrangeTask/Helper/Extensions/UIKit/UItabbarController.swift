//
//  UItabbarController.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 01/12/2023.
//

import UIKit

extension UITabBarController {
    func hideTabbar() {
        UIView.animate(withDuration: 0.3) {
            self.tabBar.isHidden = true
            self.tabBar.layer.zPosition = -1
        }
    }

    func showTabbar() {
        UIView.animate(withDuration: 0.3) {
            self.tabBar.isHidden = false
            self.tabBar.layer.zPosition = 1
        }
    }
}
