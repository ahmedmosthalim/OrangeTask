//
//  UserDetailsView.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 13/01/2023.
//

import UIKit

class MainNavigator {
    private var navigationController: UINavigationController? {
        return controller.navigationController
    }

    let controller: UIViewController

    init(_ controller: UIViewController) {
        self.controller = controller
    }
}
