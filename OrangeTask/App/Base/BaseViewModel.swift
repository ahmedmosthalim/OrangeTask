//
//  BaseViewModel.swift
// orangeTask
//
//  Created by Ahmed Mostafa on 30/01/2023.
//

import Foundation
import Combine

protocol BaseViewModelProtocal {
    func showIndicator()
    func hideIndicator()
    func showSomethingError()
    func showErrorAlert(error: String?)
    func showSuccessAlert(message: String?)
    func showLoginAlert(complation: @escaping () -> Void)
    func showDeleteAlert(complation: @escaping () -> Void)
    func showLogoutAlert(complation: @escaping () -> Void)
    func showInternetConnectionErrorAlert(completion: @escaping (() -> Void))
}

class BaseViewModel : BaseViewModelProtocal{
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
