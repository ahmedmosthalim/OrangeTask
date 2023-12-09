//
//  BaseNav.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

class BaseNav: UINavigationController {
    
    //MARK: - Properties -
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGesture()
        self.handleAppearance()
        self.isNavigationBarHidden = true
    }
    
    //MARK: - Design -
    private func handleAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: Theme.colors.mainBackgroundColor, .font: UIFont.boldSystemFont(ofSize: 17)]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        self.navigationBar.tintColor = Theme.colors.mainBackgroundColor
        appearance.backgroundColor = Theme.colors.mainBackgroundColor
    }
    private func setupGesture() {
        interactivePopGestureRecognizer?.delegate = self
        self.view.semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
    }
    
}
extension BaseNav: UIGestureRecognizerDelegate {}

