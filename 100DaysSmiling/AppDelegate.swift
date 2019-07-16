//
//  AppDelegate.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 21/06/19.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import OAuthSwift
import Swinject
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var container: Container = Container()
    var appContainer: AppContainer!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appContainer = AppContainer(with: AppDelegate.container)
        appContainer.setupContainer()
        guard let initialViewController = appContainer.container.resolve(DashboardViewController.self) else {
            fatalError("You need to have initial storyboard / view controller ")
        }
        window?.rootViewController = initialViewController
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey  : Any] = [:]) -> Bool {
        if (url.scheme == "hundreddayssmiling") {
            OAuthSwift.handle(url: url)
        }
        return true
    }
}

