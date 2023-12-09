//
//  AppDelegate.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 07/12/2023.
//

import UIKit
import IQKeyboardManager
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - App LifeCycle -

    func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: - Font -
        Theme.current.setupFont()

        // MARK: - Localization
        Bundle.swizzleLocalization()

        // MARK: - Keyboard -
        handleKeyboard()

        setFakeData()
        
        return true
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = { // persistent container
        let container = NSPersistentContainer(name: "ArticleCoreDataModel")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
}

extension AppDelegate {
    // MARK: - Keyboard -
    private func handleKeyboard() {
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().toolbarTintColor = Theme.colors.mainColor
        IQKeyboardManager.shared().keyboardDistanceFromTextField = 40
        IQKeyboardManager.shared().toolbarDoneBarButtonItemText = "done".localized
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        IQKeyboardManager.shared().layoutIfNeededOnUpdate = true
        IQKeyboardManager.shared().toolbarTintColor = Theme.colors.mainColor

        let disabledVCs: [UIViewController.Type] = []
        IQKeyboardManager.shared().disabledDistanceHandlingClasses.addObjects(from: disabledVCs)
    }
    // MARK: - Handle fonts -
    private func handleFonts() {
        UILabel.appearance().substituteFontName = fontFamilyName
        UITextView.appearance().substituteFontName = fontFamilyName
        UITextField.appearance().substituteFontName = fontFamilyName
    }

    // MARK: - Fack data -

    private func setFakeData() {
//        UserDefaults.isLogin = false
//        UserDefaults.accessToken = ""
    }
}

