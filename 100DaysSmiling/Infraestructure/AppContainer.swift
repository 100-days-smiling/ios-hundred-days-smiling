//
//  AppContainer.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class AppContainer {
    
    let container: Container
    
    private static let DashboardKey = "Dashboard"
    
    init(with container: Container) {
        self.container = container
    }
    
    func setupContainer() {
        container.register(SwinjectStoryboard.self, name: AppContainer.DashboardKey) { _ -> SwinjectStoryboard in
            return SwinjectStoryboard.create(name: AppContainer.DashboardKey, bundle: nil, container: self.container)
        }
        
        container.register(DashboardViewController.self) { resolver -> DashboardViewController in
            let storyboard = resolver.resolve(SwinjectStoryboard.self, name: AppContainer.DashboardKey)
            return (storyboard?.instantiateInitialViewController() as? DashboardViewController)!
        }.initCompleted { resolver, dashboardView in
            dashboardView.router = resolver.resolve(DashboardRouterProtocol.self)
        }
        
        AuthenticationContainer().setupContainer(with: container)
        DashboardContainer().setupContainer(with: container)
    }
}
