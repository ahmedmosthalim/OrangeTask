//
//  SplashVC.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 07/12/2023.
//

import UIKit


class SplashVC: UIViewController {
    // MARK: - IBOutlets -


    // MARK: - Properties -

    static func create() -> SplashVC {
        let vc = AppStoryboards.main.instantiate(SplashVC.self)
        return vc
    }

    // MARK: - UIViewController Events -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goNext()
        }
    }

    // MARK: - Design Methods -

    func setupDesign() {
        let window = UIApplication.shared.windows.first
        window?.backgroundColor = Theme.colors.mainColor
    }

    // MARK: - Logic Methods -

    private func goNext() {
        let vc = NewsFactory.goToNewsList()
        let nav = BaseNav(rootViewController: vc)
        AppHelper.changeWindowRoot(vc: nav)
    }

}

