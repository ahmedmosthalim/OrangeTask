//
//  UINavigationController.swift
// orangeTask
//
//  Created by Ahmed Mostafa on 07/02/2023.
//

import UIKit
extension UINavigationController {
    func removeViewController(_ controller: UIViewController.Type) {
        if let viewController = viewControllers.first(where: { $0.isKind(of: controller.self) }) {
            viewController.removeFromParent()
        }
    }
}
