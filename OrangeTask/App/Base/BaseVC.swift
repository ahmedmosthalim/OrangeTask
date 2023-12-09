//
//  BaseVC.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

class BaseVC: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseVC()
        addKeyboardDismiss()
    }

    // MARK: - Design -

    private func setupBaseVC() {
        view.backgroundColor = Theme.colors.mainBackgroundColor
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationController?.navigationBar.isHidden = true
        navigationItem.backBarButtonItem = backItem
        view.tintColor = .clear
    }

    func setupNavigationView() {
        let logo = UIImage(named: "appLogo")
        let imageView = UIImageView(image: logo)
        navigationItem.titleView = imageView
    }

    func changeNavigationBar(alpha: CGFloat) {
        navigationController?.navigationBar.subviews.first?.alpha = alpha
    }

    // MARK: - Deinit -

    deinit {
        print("\(NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? "BaseVC") is deinit, No memory leak found")
    }
}

// MARK: - Dismiss Keyboard -

extension BaseVC {
    private func addKeyboardDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Alerts and indicators -

extension BaseVC {
    func showIndicator() {
        AppIndicator.shared.show(isGif: true)
    }

    func hideIndicator() {
        AppIndicator.shared.dismiss()
    }

    func showErrorAlert(error: String?) {
        AppAlert.showErrorAlert(error: error)
    }

    func showSuccessAlert(message: String?) {
        AppAlert.showSuccessAlert(message: message)
    }

    func showSomethingError() {
        AppAlert.showSomethingError()
    }

    func showInternetConnectionErrorAlert(completion: @escaping (() -> Void)) {
        AppAlert.showInternetConnectionErrorAlert(completion: completion)
    }

    func showDeleteAlert(complation: @escaping () -> Void) {
        AppAlert.showDeleteAlert(complation: complation)
    }

    func showLoginAlert(complation: @escaping () -> Void) {
        AppAlert.showLoginAlert(complation: complation)
    }

    func showLogoutAlert(complation: @escaping () -> Void) {
        AppAlert.showLogoutAlert(complation: complation)
    }
}

// MARK: - Router -

extension UIViewController {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }

    func pop(animated: Bool = true, completion: @escaping () -> Void) {
        navigationController?.popViewController(animated: animated)

        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }

    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: true)
    }

    func popToView(ofClass: AnyClass, animated: Bool = true) {
        if let vc = navigationController?.viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            navigationController?.popToViewController(vc, animated: animated)
        }
    }
}
