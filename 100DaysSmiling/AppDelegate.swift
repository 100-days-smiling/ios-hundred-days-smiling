//
//  AppDelegate.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 21/06/19.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import OAuthSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey  : Any] = [:]) -> Bool {
        if (url.host == "hundreddayssmiling") {
            OAuthSwift.handle(url: url)
        }
        return true
    }
}

