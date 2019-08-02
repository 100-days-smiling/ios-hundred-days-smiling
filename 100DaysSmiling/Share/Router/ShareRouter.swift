//
//  ShareRouter.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 19/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import UIKit

protocol ShareRouterProtocol {
    func complete()
    func retry()
    func cancel()
}

class ShareRouter: NSObject, ShareRouterProtocol {

    static let shareNotificationKey = NSNotification.Name(rawValue: "shared")
    
    private var viewController: ShareViewController
    private var dashboardViewController: DashboardViewController
    
    init(view controller: ShareViewController, dashboard: DashboardViewController) {
        self.viewController = controller
        self.dashboardViewController = dashboard
    }
    
    func complete() {
        NotificationCenter.default.post(name: ShareRouter.shareNotificationKey, object: nil)
        self.dashboardViewController.dismiss(animated: true, completion: nil)
    }
    
    func retry() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
    
    func cancel() {
        self.dashboardViewController.dismiss(animated: true, completion: nil)
    }
}
