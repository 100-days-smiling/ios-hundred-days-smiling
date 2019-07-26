//
//  DashboardContainer.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 16/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import Swinject

class DashboardContainer {
    
    func setupContainer(with container: Container) {
        
        container.register(DashboardRouterProtocol.self) { resolver -> DashboardRouterProtocol in
            let dashboardViewController = resolver.resolve(DashboardViewController.self)!
            let cameraViewController = resolver.resolve(CameraViewController.self)!
            return DashboardRouter(view: dashboardViewController, camera: cameraViewController)
        }
        
        CameraContainer().setupContainer(with: container)
    }
}
