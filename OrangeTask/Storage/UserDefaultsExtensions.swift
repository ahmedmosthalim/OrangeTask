//
//  UserDefaultsExtensions.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

@propertyWrapper
struct ValueDefault<Value> {
    let key: String
    let defaultValue: Value
    let container: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            return container.value(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.setValue(newValue, forKey: key)
        }
    }
}

@propertyWrapper
struct ModelsDefault<Model: Codable> {
    let key: String
    let defaultValue: Model
    let container: UserDefaults = .standard

    var wrappedValue: Model {
        get {
            let decoder = JSONDecoder()
            guard let decoded = container.object(forKey: key) as? Data else { return defaultValue }
            let loadedValue = try? decoder.decode(Model.self, from: decoded)
            return loadedValue ?? defaultValue
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                container.set(encoded, forKey: key)
                container.synchronize()
            }
        }
    }
}

extension UserDefaults {
    private enum Keys: String {
        case appCurancy
        case themeStyle
        case googleMapKey
        case accessToken
        case pushNotificationToken
        case isFirstTime
        case isLogin
        case notificationCount
        case userLat
        case userLong
        case cartCount
        case isDelegateAvailable
    }

    @ModelsDefault(key: Keys.themeStyle.rawValue, defaultValue: .light)
    static var themeStyle: Theme.Style


    @ValueDefault(key: Keys.googleMapKey.rawValue, defaultValue: String())
    static var googleMapKey: String

    @ValueDefault(key: Keys.isDelegateAvailable.rawValue, defaultValue: false)
    static var isDelegateAvailable: Bool
    
    @ValueDefault(key: Keys.isLogin.rawValue, defaultValue: false)
    static var isLogin: Bool {
        didSet {
//            NotificationCenter.default.post(name: .isLoginChanged, object: nil)
        }
    }

    @ModelsDefault(key: Keys.accessToken.rawValue, defaultValue: nil)
    static var accessToken: String?

    @ValueDefault(key: Keys.pushNotificationToken.rawValue, defaultValue: nil)
    static var pushNotificationToken: String?

    @ValueDefault(key: Keys.isFirstTime.rawValue, defaultValue: true)
    static var isFirstTime: Bool

    @ValueDefault(key: Keys.notificationCount.rawValue, defaultValue: 0)
    static var notificationCount: Int {
        didSet {
//            NotificationCenter.default.post(name: .updateNotificationCount, object: nil)
//            UIApplication.shared.applicationIconBadgeNumber = notificationCount
        }
    }

    @ValueDefault(key: Keys.cartCount.rawValue, defaultValue: 0)
    static var cartCount: Int {
        didSet {
//            NotificationCenter.default.post(name: .updateCartCount, object: nil)
        }
    }

    @ValueDefault(key: Keys.userLat.rawValue, defaultValue: 0)
    static var userLat: Double

    @ValueDefault(key: Keys.userLong.rawValue, defaultValue: 0)
    static var userLong: Double

    @ValueDefault(key: Keys.appCurancy.rawValue, defaultValue: "")
    static var appCurancy: String

    func removeAll() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
}
